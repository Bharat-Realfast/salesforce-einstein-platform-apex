
@isTest
private class Einstein_HttpBodyPartExample_2_Tests {

    @testSetup
    static void setup() {
        // No setup needed for these tests
    }

    @isTest
    static void testGetNameWithValidName() {
        // Testing happy path scenario
        String validName = 'ValidName';
        long validLabelId = 1;
        String validData = 'ValidData';
        
        Einstein_HttpBodyPartExample instance = new Einstein_HttpBodyPartExample(validName, validLabelId, validData);
        String result = instance.getName();
        
        System.assertEquals(validName, result, 'The name should be the same as what was set');
    }
    
    @isTest
    static void testSetNameWithEmptyName() {
        // Testing sad path scenario for empty name
        String invalidName = '';
        long validLabelId = 1;
        String validData = 'ValidData';
        Boolean exceptionThrown = false;
        
        try {
            Einstein_HttpBodyPartExample instance = new Einstein_HttpBodyPartExample(invalidName, validLabelId, validData);
        } catch (Einstein_StringIsEmptyException e) {
            exceptionThrown = true;
            System.assertEquals('name', e.getMessage(), 'The exception message should indicate the empty name');
        }
        
        System.assert(exceptionThrown, 'An exception should have been thrown for an empty name');
    }
    
    @isTest
    static void testSetNameWithLongName() {
        // Testing sad path scenario for name being too long
        String invalidName = generateLongString(181);
        long validLabelId = 1;
        String validData = 'ValidData';
        Boolean exceptionThrown = false;
        
        try {
            Einstein_HttpBodyPartExample instance = new Einstein_HttpBodyPartExample(invalidName, validLabelId, validData);
        } catch (Einstein_StringTooLongException e) {
            exceptionThrown = true;
        }

        System.assert(exceptionThrown, 'An exception should have been thrown for a name longer than 180 characters');
    }
    
    // Helper method to generate a string of a certain length
    private static String generateLongString(Integer length) {
        String longString = '';
        while (longString.length() < length) {
            longString += 'x'; // Append 'x' to make the string longer
        }
        return longString;
    }
}
