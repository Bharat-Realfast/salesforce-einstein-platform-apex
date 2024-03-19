
@isTest
private class Einstein_HttpBodyPartPrediction_2_Tests {
 
    // Since we are not performing any DML operations, we do not need to bypass triggers here.
    
    @testSetup
    static void setup() {
        // Not necessary to create test data for getter method testing.
    }
    
    @isTest
    static void testGetModelIdWithNonNullValue() {
        // Set up test data
        String expectedModelId = 'testModelId';
        Einstein_HttpBodyPartPrediction prediction = 
            new Einstein_HttpBodyPartPrediction(expectedModelId, 'testData', 0, 'testSampleId', Einstein_HttpBodyPartPrediction.Types.BASE64);
        
        // Execute the test
        String actualModelId = prediction.getModelId();
        
        // Verify the results
        System.assertEquals(expectedModelId, actualModelId, 'The modelId should match the expected value.');
    }
    
    @isTest
    static void testGetModelIdWithNullValue() {
        // Set up test data
        String expectedModelId = null;
        Einstein_HttpBodyPartPrediction prediction = 
            new Einstein_HttpBodyPartPrediction(expectedModelId, 'testData', 0, 'testSampleId', Einstein_HttpBodyPartPrediction.Types.BASE64);
        
        // Execute the test
        String actualModelId = prediction.getModelId();
        
        // Verify the results
        System.assertEquals(expectedModelId, actualModelId, 'The modelId should be null.');
    }
}
