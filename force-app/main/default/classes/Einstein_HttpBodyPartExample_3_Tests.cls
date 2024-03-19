
@isTest
private class Einstein_HttpBodyPartExample_3_Tests {

    @isTest
    static void testSetNameValid() {
        // Happy path
        String testName = 'ValidName';
        Einstein_HttpBodyPartExample example = new Einstein_HttpBodyPartExample(testName, 1, 'TestData');

        Test.startTest();
        example.setName(testName);
        Test.stopTest();

        // Assertions
        System.assertEquals(testName, example.getName(), 'The name should be set successfully.');
    }

    @isTest
    static void testSetNameEmpty() {
        // Sad path
        String testName = '';

        Test.startTest();
        try {
            Einstein_HttpBodyPartExample example = new Einstein_HttpBodyPartExample(testName, 1, 'TestData');
            System.assert(false, 'An exception should have been thrown for an empty name.');
        } catch (Einstein_StringIsEmptyException e) {
            // Expected exception
            System.assert(true, 'An exception for empty name was correctly thrown.');
        }
        Test.stopTest();
    }

    @isTest
    static void testSetNameTooLong() {
        // Exception scenario
        String testName = '';
        for(Integer i = 0; i < 181; i++) {
            testName += 'a';
        }

        Test.startTest();
        try {
            Einstein_HttpBodyPartExample example = new Einstein_HttpBodyPartExample(testName, 1, 'TestData');
            System.assert(false, 'An exception should have been thrown for a name that is too long.');
        } catch (Einstein_StringTooLongException e) {
            // Expected exception
            System.assert(true, 'An exception for too long name was correctly thrown.');
        }
        Test.stopTest();
    }
    
}
