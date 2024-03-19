
@isTest
private class Einstein_HttpBodyPartPrediction_10_Tests {

    @isTest
    static void testGetNumResultsWithValidValue() {
        Einstein_HttpBodyPartPrediction prediction = new Einstein_HttpBodyPartPrediction(
            'modelId',
            'data',
            5, // Valid number of results
            'sampleId',
            Einstein_HttpBodyPartPrediction.Types.BASE64
        );

        Test.startTest();
        Integer actualNumResults = prediction.getNumResults();
        Test.stopTest();

        // Positive assertion: Check if the actualNumResults matches the expected value
        System.assertEquals(5, actualNumResults, 'The numResults should be equal to the value set.');
    }

    @isTest
    static void testGetNumResultsWithNullValue() {
        Einstein_HttpBodyPartPrediction prediction = new Einstein_HttpBodyPartPrediction(
            'modelId',
            'data',
            null, // numResults not set
            'sampleId',
            Einstein_HttpBodyPartPrediction.Types.BASE64
        );

        Test.startTest();
        Integer actualNumResults = prediction.getNumResults();
        Test.stopTest();

        // Negative assertion: Check if the actualNumResults is null
        System.assertNull(actualNumResults, 'The numResults should be null as it is not set.');
        
        // Additional positive assertion: Check if the actualNumResults is actually null to reinforce the test's validity
        System.assertEquals(null, actualNumResults, 'The numResults should be explicitly null as it is not set.');
    }
}
