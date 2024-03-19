
@isTest
private class Einstein_Invocable_Language_2_Tests {

    @testSetup
    static void setupTestData() {
        // Standard Salesforce Account object and fields are used for example purposes
        Account testAccount = new Account(Name = 'Test Account', Description = 'Test Description');
        insert testAccount;
    }

    // Mock class for callouts
    public class EinsteinCalloutMock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            // Create a fake response
            HttpResponse res = new HttpResponse();
            res.setStatusCode(200);
            // Create a fake response body
            res.setBody('{"probabilities":[{"label":"Positive","probability":0.95}]}');
            res.setHeader('Content-Type', 'application/json');
            return res;
        }
    }

    // Happy path scenario
    @isTest
    static void testGetAnalysisWithValidData() {
        // Mock the callout response
        Test.setMock(HttpCalloutMock.class, new EinsteinCalloutMock());

        // Prepare the test data
        Account testAccount = [SELECT Id, Description FROM Account LIMIT 1];

        // Create a LanguageRequest object and serialize it for input
        Einstein_Invocable_Language.LanguageRequest lr = new Einstein_Invocable_Language.LanguageRequest();
        lr.RecordId = testAccount.Id;
        lr.FieldToAnalyze = 'Description';
        lr.LabelStoreField = 'Description'; // Using Description for simplicity; replace with your actual field
        lr.ModelType = 'Sentiment';
        String serializedLR = JSON.serialize(lr);

        // Call the method with valid data
        Test.startTest();
        Einstein_Invocable_Language.getAnalysis(new List<String>{serializedLR});
        Test.stopTest();

        // Verify the records were updated correctly
        Account updatedAccount = [SELECT Description FROM Account WHERE Id = :lr.RecordId];
        System.assertNotEquals(null, updatedAccount.Description, 'The description field should be updated with the prediction label.');
    }

    // Sad path scenario
    @isTest
    static void testGetAnalysisWithEmptyList() {
        // Prepare the test data
        Account testAccount = [SELECT Id, Description FROM Account LIMIT 1];

        // Call the method with an empty list
        Test.startTest();
        Einstein_Invocable_Language.getAnalysis(new List<String>());
        Test.stopTest();

        // Verify that no changes were made
        Account unchangedAccount = [SELECT Description FROM Account WHERE Id = :testAccount.Id];
        System.assertEquals(null, unchangedAccount.Description, 'The description field should not be updated.');
    }

    // Exception scenario
    @isTest
    static void testGetAnalysisWithInvalidData() {
        // Prepare the test data
        Account testAccount = [SELECT Id FROM Account LIMIT 1];

        // Create a LanguageRequest object with an invalid ID
        Einstein_Invocable_Language.LanguageRequest lr = new Einstein_Invocable_Language.LanguageRequest();
        lr.RecordId = '000000000000000'; // Invalid ID format
        lr.FieldToAnalyze = 'Description';
        lr.LabelStoreField = 'Description'; // Using Description for simplicity; replace with your actual field
        lr.ModelType = 'Sentiment';
        String serializedLR = JSON.serialize(lr);

        Boolean didExceptionOccur = false;
        try {
            Test.startTest();
            Einstein_Invocable_Language.getAnalysis(new List<String>{serializedLR});
            Test.stopTest();
        } catch (Exception e) {
            didExceptionOccur = true;
        }

        // Verify that an exception was thrown
        System.assert(didExceptionOccur, 'An exception should have been thrown due to invalid record ID.');
    }
}
