
@isTest
public class Einstein_HttpBodyPartPrediction_11_Tests {

    // Use @testSetup to setup test data that's common across test methods
    @testSetup
    static void setup() {
        // For this test class, we are just testing the method in isolation, so no test data setup is required.
    }

    // Test setting a positive number of results (Happy Path)
    @isTest
    static void testSetPositiveNumResults() {
        Einstein_HttpBodyPartPrediction prediction = new Einstein_HttpBodyPartPrediction(
            'modelId', 'data', 1, 'sampleId', Einstein_HttpBodyPartPrediction.Types.BASE64);

        // Set number of results to a positive value
        prediction.setNumResults(10);

        // Assertions
        System.assertEquals(10, prediction.getNumResults(), 'Number of results should be set to 10.');
    }

    // Test setting a negative number of results (Sad Path)
    @isTest
    static void testSetNegativeNumResults() {
        Einstein_HttpBodyPartPrediction prediction = new Einstein_HttpBodyPartPrediction(
            'modelId', 'data', 1, 'sampleId', Einstein_HttpBodyPartPrediction.Types.BASE64);

        // Set number of results to a negative value
        prediction.setNumResults(-5);

        // Assertions
        System.assertEquals(-5, prediction.getNumResults(), 'Number of results should be set to -5.');
    }

    // Test setting the number of results to null (Exceptional Scenario)
    @isTest
    static void testSetNullNumResults() {
        Einstein_HttpBodyPartPrediction prediction = new Einstein_HttpBodyPartPrediction(
            'modelId', 'data', 1, 'sampleId', Einstein_HttpBodyPartPrediction.Types.BASE64);

        // Set number of results to null
        prediction.setNumResults(null);

        // Assertions
        System.assertEquals(null, prediction.getNumResults(), 'Number of results should be null.');
    }
}
