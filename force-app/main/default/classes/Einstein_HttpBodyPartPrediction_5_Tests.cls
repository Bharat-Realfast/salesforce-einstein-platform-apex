
@isTest
private class Einstein_HttpBodyPartPrediction_5_Tests {
    
    // Test for Happy Path
    @isTest
    static void testSetDataWithValidString() {
        String testData = 'TestData';
        Einstein_HttpBodyPartPrediction prediction = 
            new Einstein_HttpBodyPartPrediction('modelId', testData, 5, 'sampleId', Einstein_HttpBodyPartPrediction.Types.BASE64);

        prediction.setData(testData); // Set data to a valid string
        String resultData = prediction.getData();
        
        // Assertions
        System.assertNotEquals(null, resultData, 'Data should not be null');
        System.assertEquals(testData, resultData, 'Data should match the set value');
    }
    
    // Test for setting data to null
    @isTest
    static void testSetDataWithNull() {
        Einstein_HttpBodyPartPrediction prediction = 
            new Einstein_HttpBodyPartPrediction('modelId', 'initialData', 5, 'sampleId', Einstein_HttpBodyPartPrediction.Types.BASE64);

        prediction.setData(null); // Set data to null
        String resultData = prediction.getData();
        
        // Assertions
        System.assertEquals(null, resultData, 'Data should be null when set to null');
    }
}
