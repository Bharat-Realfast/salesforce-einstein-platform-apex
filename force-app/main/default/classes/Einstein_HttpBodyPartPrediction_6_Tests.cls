
@isTest
private class Einstein_HttpBodyPartPrediction_6_Tests {

    @testSetup
    static void setup() {
        // No setup is required as we are testing a simple getter method
    }

    @isTest
    static void testGetSampleIdHappyPath() {
        Einstein_HttpBodyPartPrediction prediction = new Einstein_HttpBodyPartPrediction('model123', 'data', 1, 'sample123', Einstein_HttpBodyPartPrediction.Types.BASE64);
        String sampleId = prediction.getSampleId();
        
        System.assertNotEquals(null, sampleId, 'The sampleId should not be null');
        System.assertEquals('sample123', sampleId, 'The sampleId should match the initialized value');
    }

    @isTest
    static void testGetSampleIdSadPath() {
        Einstein_HttpBodyPartPrediction prediction = new Einstein_HttpBodyPartPrediction('model123', 'data', 1, null, Einstein_HttpBodyPartPrediction.Types.BASE64);
        String sampleId = prediction.getSampleId();
        
        System.assertEquals(null, sampleId, 'The sampleId should be null');
    }

    // No need to write test for Exceptional Scenario as getter method doesn't throw exceptions.
}
