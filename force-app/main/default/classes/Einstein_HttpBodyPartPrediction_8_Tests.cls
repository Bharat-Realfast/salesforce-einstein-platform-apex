
@isTest
private class Einstein_HttpBodyPartPrediction_8_Tests {

    // Since we are testing a simple getter here, @testSetup isn't necessary.

    @isTest
    static void testGetTypeBase64() {
        // Prepare Test Data
        Einstein_HttpBodyPartPrediction instance = new Einstein_HttpBodyPartPrediction(
            'modelId123', 'data', 1, 'sampleId123', Einstein_HttpBodyPartPrediction.Types.BASE64);

        // Execute Test
        Einstein_HttpBodyPartPrediction.Types actualType = instance.getType();

        // Verify Results
        System.assertEquals(Einstein_HttpBodyPartPrediction.Types.BASE64, actualType,
            'The type should be set to BASE64.');
    }

    @isTest
    static void testGetTypeURL() {
        // Prepare Test Data
        Einstein_HttpBodyPartPrediction instance = new Einstein_HttpBodyPartPrediction(
            'modelId123', 'http://example.com/image.jpg', 3, 'sampleId123', Einstein_HttpBodyPartPrediction.Types.URL);

        // Execute Test
        Einstein_HttpBodyPartPrediction.Types actualType = instance.getType();

        // Verify Results
        System.assertEquals(Einstein_HttpBodyPartPrediction.Types.URL, actualType,
            'The type should be set to URL.');
    }

    // Additional test methods for each enum value can be added similarly.
}
