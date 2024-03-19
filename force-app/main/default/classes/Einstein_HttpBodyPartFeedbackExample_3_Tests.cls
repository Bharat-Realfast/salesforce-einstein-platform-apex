
@isTest
private class Einstein_FeedbackTest {

    @isTest
    static void testValidName() {
        // Setup
        String name = 'ValidName';
        Einstein_HttpBodyPartFeedbackExample feedback = new Einstein_HttpBodyPartFeedbackExample(name, 'expectedLabel', 'modelId', 'data', Einstein_HttpBodyPartFeedbackExample.Types.BASE64);

        // Execution
        feedback.setName(name);
        
        // Verification
        System.assertEquals(name, feedback.getName(), 'The name should be set correctly for valid input');
    }
    
    @isTest
    static void testEmptyName() {
        // Setup
        String name = '';
        Einstein_HttpBodyPartFeedbackExample feedback = new Einstein_HttpBodyPartFeedbackExample(name, 'expectedLabel', 'modelId', 'data', Einstein_HttpBodyPartFeedbackExample.Types.BASE64);

        // Execution
        feedback.setName(name);
        
        // Verification
        System.assertEquals(name, feedback.getName(), 'The name should be set to an empty string without throwing an exception');
    }

    @isTest
    static void testNameTooLong() {
        // Setup
        String longName = String.join(new List<String>(182), 'a'); // Generates a string with 181 'a' characters
        
        // Execution and Verification
        try {
            Einstein_HttpBodyPartFeedbackExample feedback = new Einstein_HttpBodyPartFeedbackExample(longName, 'expectedLabel', 'modelId', 'data', Einstein_HttpBodyPartFeedbackExample.Types.BASE64);
            feedback.setName(longName);
            System.assert(false, 'An exception should have been thrown for a name that exceeds the maximum length');
        } catch (Einstein_StringTooLongException e) {
            // Expected exception
            System.assert(true, 'The exception should be an Einstein_StringTooLongException');
        } catch (Exception e) {
            System.assert(false, 'An unexpected exception was thrown: ' + e.getMessage());
        }
    }
}
