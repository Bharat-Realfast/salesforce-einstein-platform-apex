
@isTest
private class Einstein_HttpBodyPartTraining_5_Tests {

    // Test for Happy Path
    @isTest
    static void testSetNameHappyPath() {
        Einstein_HttpBodyPartTraining instance = new Einstein_HttpBodyPartTraining(1L, 'Valid Name', 10, 0.0005, null);
        Test.startTest();
        instance.setName('New Valid Name');
        Test.stopTest();
        
        // Assertion to check if the name was set correctly
        String expectedName = 'New Valid Name';
        String actualName = instance.getName();
        System.assertEquals(expectedName, actualName, 'The name should be set correctly for valid input.');
    }

    // Test for Sad Path - Setting an empty string
    @isTest
    static void testSetNameWithEmptyString() {
        Einstein_HttpBodyPartTraining instance = new Einstein_HttpBodyPartTraining(1L, 'Valid Name', 10, 0.0005, null);
        try {
            Test.startTest();
            instance.setName('');
            Test.stopTest();
            System.assert(false, 'An exception should have been thrown when setting an empty name.');
        } catch (Einstein_StringIsEmptyException e) {
            // Assertion to check if the correct exception is thrown
            System.assert(e.getMessage().contains('name'), 'The exception message should contain the field name that caused the exception.');
        }
    }

    // Test for Exceptional Scenario - Setting a string longer than 180 characters
    @isTest
    static void testSetNameWithTooLongString() {
        Einstein_HttpBodyPartTraining instance = new Einstein_HttpBodyPartTraining(1L, 'Valid Name', 10, 0.0005, null);
        String longName = 'a'.repeat(181); // Generates a string with 181 'a' characters
        
        try {
            Test.startTest();
            instance.setName(longName);
            Test.stopTest();
            System.assert(false, 'An exception should have been thrown for a name longer than 180 characters.');
        } catch (Einstein_StringTooLongException e) {
            // Assertion to check if the correct exception is thrown
            System.assert(e.getMessage().contains('name'), 'The exception message should contain the field name and the reason for the exception.');
        }
    }
}
