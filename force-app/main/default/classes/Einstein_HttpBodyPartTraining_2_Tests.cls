
@isTest
private class Einstein_HttpBodyPartTraining_2_Tests {
    
    @isTest
    static void testGetDatasetIdWithValidValue() {
        // Given
        Long validDatasetId = 12345L;
        Einstein_HttpBodyPartTraining training = new Einstein_HttpBodyPartTraining(validDatasetId, 'testName', 10, 0.005, null);
        
        // When
        Long resultDatasetId = training.getDatasetId();
        
        // Then
        System.assertEquals(validDatasetId, resultDatasetId, 'The datasetId should be the same as the one set in the constructor.');
    }

    @isTest
    static void testSetDatasetIdWithZeroValue() {
        // Given
        Long invalidDatasetId = 0L;
        Exception caughtException = null;
        
        // When
        try {
            new Einstein_HttpBodyPartTraining(invalidDatasetId, 'testName', 10, 0.005, null);
        } catch (Exception e) {
            caughtException = e;
        }
        
        // Then
        System.assertNotEquals(null, caughtException, 'An exception should have been thrown when setting datasetId to 0.');
        System.assert(caughtException instanceof Einstein_NoValuesException, 'The thrown exception should be an Einstein_NoValuesException.');
    }
}
