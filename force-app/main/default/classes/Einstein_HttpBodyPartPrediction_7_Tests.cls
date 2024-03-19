
@isTest
private class Einstein_HttpBodyPartPrediction_7_Tests {

    // Since the setSampleId method does not interact with Salesforce data or schema, 
    // we do not need @testSetup to create test data here.

    // Test method for setting a valid sampleId
    @isTest
    static void testSetValidSampleId() {
        Einstein_HttpBodyPartPrediction prediction = new Einstein_HttpBodyPartPrediction('model123', 'data', 5, 'sample123', Einstein_HttpBodyPartPrediction.Types.BASE64);
        prediction.setSampleId('newSampleId');
        
        // Assertions
        System.assertNotEquals(null, prediction.getSampleId(), 'The sampleId should not be null.');
        System.assertEquals('newSampleId', prediction.getSampleId(), 'The sampleId should be updated to the new value.');
    }

    // Test method for setting an empty sampleId
    @isTest
    static void testSetEmptySampleId() {
        Einstein_HttpBodyPartPrediction prediction = new Einstein_HttpBodyPartPrediction('model123', 'data', 5, 'sample123', Einstein_HttpBodyPartPrediction.Types.BASE64);
        prediction.setSampleId('');
        
        // Assertions
        System.assertNotEquals(null, prediction.getSampleId(), 'The sampleId should not be null even when set to an empty string.');
        System.assertEquals('', prediction.getSampleId(), 'The sampleId should be updated to an empty string.');
    }

    // Test method for setting a null sampleId
    @isTest
    static void testSetNullSampleId() {
        Einstein_HttpBodyPartPrediction prediction = new Einstein_HttpBodyPartPrediction('model123', 'data', 5, 'sample123', Einstein_HttpBodyPartPrediction.Types.BASE64);
        prediction.setSampleId(null);
        
        // Assertions
        System.assertEquals(null, prediction.getSampleId(), 'The sampleId should be set to null.');
    }
}
