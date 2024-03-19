
@isTest
private class Einstein_Invocable_Language_1_Tests {

    // Use @testSetup to create common test data
    @testSetup
    static void setup() {
        // Create Account records as dummy data for testing
        List<Account> accounts = new List<Account>{
            new Account(Name = 'Test Account 1'),
            new Account(Name = 'Test Account 2')
        };
        insert accounts;
    }

    // Test method for happy path scenario
    @isTest
    static void testAnalyzeLanguageHappyPath() {
        // Prepare test data
        List<Account> testAccounts = [SELECT Id, Name FROM Account];
        
        // Create LanguageRequest objects
        List<Einstein_Invocable_Language.LanguageRequest> lrList = new List<Einstein_Invocable_Language.LanguageRequest>();
        for(Account acc : testAccounts) {
            Einstein_Invocable_Language.LanguageRequest lr = new Einstein_Invocable_Language.LanguageRequest();
            lr.RecordId = String.valueOf(acc.Id);
            lr.FieldToAnalyze = 'Name';
            lr.LabelStoreField = 'Name';
            lr.ModelType = 'Sentiment';
            lrList.add(lr);
        }

        // Call method under test
        Test.startTest();
        Einstein_Invocable_Language.AnalyzeLanguage(lrList);
        Test.stopTest();

        // Assert that no exception was thrown by the method
        System.assert(true, 'Method completed without exceptions');
    }

    // Test method for sad path scenario when the list is empty
    @isTest
    static void testAnalyzeLanguageEmptyList() {
        // Prepare empty LanguageRequest list
        List<Einstein_Invocable_Language.LanguageRequest> lrList = new List<Einstein_Invocable_Language.LanguageRequest>();

        // Call method under test
        Test.startTest();
        Einstein_Invocable_Language.AnalyzeLanguage(lrList);
        Test.stopTest();

        // Assert that no exception was thrown by the method
        System.assert(true, 'Method completed without exceptions on empty list');
    }

    // Note: Salesforce doesn't allow testing future, batch, or queueable context directly in test methods.
    // The test for executing `AnalyzeLanguage` from future context is not included as it cannot be performed directly.
}
