
@isTest
public class Einstein_HttpBodyPartPrediction_4_Tests {
    
    // Test setup method to create common test data
    @testSetup
    static void setup() {
        // Setup data if needed for this test class
        // For this scenario, no data setup is needed
    }

    // Test for happy path scenario
    @isTest
    static void testGetDataReturnsCorrectData() {
        Einstein_HttpBodyPartPrediction prediction = new Einstein_HttpBodyPartPrediction('modelId', 'testData', 1, 'sampleId', Einstein_HttpBodyPartPrediction.Types.BASE64);
        String testData = prediction.getData();
        // Assertions
        System.assertEquals('testData', testData, 'The data should be the same as what was set.');
    }

    // Test for sad path scenario (default state)
    @isTest
    static void testGetDataDefaultState() {
        Einstein_HttpBodyPartPrediction prediction = new Einstein_HttpBodyPartPrediction('modelId', null, 1, 'sampleId', Einstein_HttpBodyPartPrediction.Types.BASE64);
        String testData = prediction.getData();
        // Assertions
        System.assertEquals(null, testData, 'The data should be null as it was not set.');
    }

    // Since exceptional scenario is not applicable here, no need to write a test for that.
}
