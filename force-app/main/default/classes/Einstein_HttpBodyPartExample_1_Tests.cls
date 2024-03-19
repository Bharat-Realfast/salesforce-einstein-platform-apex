
@isTest
private class Einstein_HttpBodyPartExample_1_Tests {

    // Happy path test
    @isTest
    static void testBuildMethodSuccess() {
        String validName = 'ValidName';
        Long validLabelId = 1L;
        String validData = 'ValidData';
        
        Einstein_HttpBodyPartExample instance = new Einstein_HttpBodyPartExample(validName, validLabelId, validData);
        Blob resultBlob = instance.build();
        
        // Assertions
        System.assertNotEquals(null, resultBlob, 'The returned blob should not be null.');
        // We assume the blob should at least contain the encoded name and data, so we check for a minimum length.
        System.assert(resultBlob.size() > 0, 'The blob should not be empty');
    }
    
    // Test for exception handling, we will use the setter methods to validate this as build() itself does not throw exceptions
    @isTest
    static void testSetNameExceptionHandling() {
        String invalidName = ''; // Empty name should trigger Einstein_StringIsEmptyException
        Long validLabelId = 1L;
        String validData = 'ValidData';
        
        Boolean didExceptionOccur = false;
        try {
            Einstein_HttpBodyPartExample instance = new Einstein_HttpBodyPartExample(invalidName, validLabelId, validData);
        } catch (Einstein_StringIsEmptyException e) {
            didExceptionOccur = true;
            System.assertEquals('name', e.getMessage(), 'Exception message should indicate the empty name field');
        }
        System.assert(didExceptionOccur, 'An exception should have been thrown for an empty name');
    }

    // Test for exception handling with invalid labelId
    @isTest
    static void testSetLabelIdExceptionHandling() {
        String validName = 'ValidName';
        Long invalidLabelId = 0L; // Invalid labelId should trigger Einstein_NullPointerException
        String validData = 'ValidData';
        
        Boolean didExceptionOccur = false;
        try {
            Einstein_HttpBodyPartExample instance = new Einstein_HttpBodyPartExample(validName, invalidLabelId, validData);
        } catch (Einstein_NullPointerException e) {
            didExceptionOccur = true;
            System.assertEquals('Labels cannot be null', e.getMessage(), 'Exception message should indicate the invalid labelId');
        }
        System.assert(didExceptionOccur, 'An exception should have been thrown for an invalid labelId');
    }

    // Test for exception handling with invalid data
    @isTest
    static void testSetDataExceptionHandling() {
        String validName = 'ValidName';
        Long validLabelId = 1L;
        String invalidData = ''; // Empty data should trigger Einstein_StringIsEmptyException
        
        Boolean didExceptionOccur = false;
        try {
            Einstein_HttpBodyPartExample instance = new Einstein_HttpBodyPartExample(validName, validLabelId, invalidData);
        } catch (Einstein_StringIsEmptyException e) {
            didExceptionOccur = true;
            System.assertEquals('data', e.getMessage(), 'Exception message should indicate the empty data field');
        }
        System.assert(didExceptionOccur, 'An exception should have been thrown for empty data');
    }
}
