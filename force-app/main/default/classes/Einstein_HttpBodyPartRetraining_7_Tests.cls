
@isTest
private class Einstein_HttpBodyPartRetraining_7_Tests {

    // Happy path: Set a valid learning rate within the allowed range
    @isTest
    static void testSetLearningRateWithinRange() {
        Einstein_HttpBodyPartRetraining retraining = new Einstein_HttpBodyPartRetraining('modelId', 5, 0.001, null);
        retraining.setLearningRate(0.005);
        
        Decimal expectedRate = 0.005;
        Decimal actualRate = retraining.getLearningRate();
        
        System.assertEquals(expectedRate, actualRate, 'The learning rate should be set correctly within the allowed range.');
    }

    // Sad path: Set a learning rate that's too small (below MIN_LEARNING_RATE)
    @isTest
    static void testSetLearningRateTooSmall() {
        Boolean caughtException = false;
        try {
            Einstein_HttpBodyPartRetraining retraining = new Einstein_HttpBodyPartRetraining('modelId', 5, 0.001, null);
            retraining.setLearningRate(0.00001);
        } catch (Einstein_NumberTooSmallException e) {
            caughtException = true;
        }
        
        System.assert(caughtException, 'An exception should be thrown when the learning rate is too small.');
    }

    // Sad path: Set a learning rate that's too large (above MAX_LEARNING_RAGE)
    @isTest
    static void testSetLearningRateTooLarge() {
        Boolean caughtException = false;
        try {
            Einstein_HttpBodyPartRetraining retraining = new Einstein_HttpBodyPartRetraining('modelId', 5, 0.001, null);
            retraining.setLearningRate(0.02);
        } catch (Einstein_NumberTooBigException e) {
            caughtException = true;
        }
        
        System.assert(caughtException, 'An exception should be thrown when the learning rate is too large.');
    }

    // Exceptional scenario: Provide `null` as the learning rate
    @isTest
    static void testSetLearningRateNull() {
        Einstein_HttpBodyPartRetraining retraining = new Einstein_HttpBodyPartRetraining('modelId', 5, 0.001, null);
        retraining.setLearningRate(null);
        Blob bodyBlob = retraining.build();
        
        String bodyString = EncodingUtil.base64Encode(bodyBlob);
        Boolean containsLearningRate = bodyString.contains('learningRate');
        
        System.assert(!containsLearningRate, 'The build method output should not contain learningRate parameter when set to null.');
    }

    // Exceptional scenario: Provide 0 as the learning rate
    @isTest
    static void testSetLearningRateZero() {
        Einstein_HttpBodyPartRetraining retraining = new Einstein_HttpBodyPartRetraining('modelId', 5, 0.001, null);
        retraining.setLearningRate(0);
        Blob bodyBlob = retraining.build();
        
        String bodyString = EncodingUtil.base64Encode(bodyBlob);
        Boolean containsLearningRate = bodyString.contains('learningRate');
        
        System.assert(!containsLearningRate, 'The build method output should not contain learningRate parameter when set to 0.');
    }
}
