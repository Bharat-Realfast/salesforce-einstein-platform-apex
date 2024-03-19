
@isTest
private class EILF2_Tests {

    @testSetup
    static void makeTestData() {
        // No test data needed as we are testing processing of JSON strings
    }

    private static List<String> createFeedbackJSON() {
        Einstein_Invocable_Language_Feedback.LanguageFeedback lf = 
            new Einstein_Invocable_Language_Feedback.LanguageFeedback();
        lf.ModelId = 'modelId';
        lf.Text = 'Incorrect example text';
        lf.Label = 'Expected label';
        
        String serializedLF = JSON.serialize(lf);
        return new List<String>{ serializedLF };
    }

    @isTest
    static void testValidInput() {
        List<String> validInput = createFeedbackJSON();

        Test.startTest();
        Einstein_Invocable_Language_Feedback.giveFeedback(validInput);
        Test.stopTest();
        
        // Assert that no exceptions were thrown during execution
        System.assert(true, 'The giveFeedback method should process valid input without exceptions.');
    }

    @isTest
    static void testEmptyInput() {
        List<String> emptyInput = new List<String>();

        Test.startTest();
        Einstein_Invocable_Language_Feedback.giveFeedback(emptyInput);
        Test.stopTest();
        
        // Assert that no exceptions were thrown during execution
        System.assert(true, 'The giveFeedback method should handle an empty input list without exceptions.');
    }

    @isTest
    static void testInvalidInput() {
        String invalidJSON = 'Not a JSON string';
        List<String> invalidInput = new List<String>{ invalidJSON };

        Boolean exceptionThrown = false;
        Test.startTest();
        try {
            Einstein_Invocable_Language_Feedback.giveFeedback(invalidInput);
        } catch (Exception e) {
            exceptionThrown = true;
            // Assert that an exception was thrown
            System.assert(e.getMessage().contains('Unrecognized token'), 'The method should throw an exception for invalid input.');
        }
        Test.stopTest();

        // Confirm that an exception was indeed thrown
        System.assert(exceptionThrown, 'An exception should have been thrown for invalid JSON input.');
    }
}
