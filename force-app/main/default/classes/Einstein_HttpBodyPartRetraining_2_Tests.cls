
@isTest
private class Einstein_HttpBodyPartRetraining_2_Tests {

    // As there are no triggers to bypass and no DML operations, we won't need to use TriggerHandler.bypass here.

    // This method will test the happy path for getModelId
    @isTest
    static void testGetModelIdValid() {
        String validModelId = '12345';
        Einstein_HttpBodyPartRetraining retrainingInstance = new Einstein_HttpBodyPartRetraining(validModelId, 10, 0.001, null);
        String retrievedModelId = retrainingInstance.getModelId();
        
        System.assertEquals(validModelId, retrievedModelId, 'The retrieved model ID should match the valid model ID provided.');
    }

    // This method will test the sad path for getModelId when an empty string is provided
    @isTest
    static void testGetModelIdEmpty() {
        String emptyModelId = '';
        try {
            Einstein_HttpBodyPartRetraining retrainingInstance = new Einstein_HttpBodyPartRetraining(emptyModelId, 10, 0.001, null);
            System.assert(false, 'An exception should have been thrown for an empty modelId.');
        } catch (Einstein_StringIsEmptyException e) {
            System.assert(true, 'The expected exception was thrown for an empty modelId.');
        }
    }

    // This method will test the exceptional scenario for getModelId when a null value is provided
    @isTest
    static void testGetModelIdNull() {
        try {
            Einstein_HttpBodyPartRetraining retrainingInstance = new Einstein_HttpBodyPartRetraining(null, 10, 0.001, null);
            System.assert(false, 'An exception should have been thrown for a null modelId.');
        } catch (Einstein_StringIsEmptyException e) {
            System.assert(true, 'The expected exception was thrown for a null modelId.');
        }
    }
}
