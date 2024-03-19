
@isTest
private class Einstein_HttpBodyPartTraining_8_Tests {

    @isTest
    static void testGetLearningRate_Valid() {
        // Setup
        Decimal validLearningRate = 0.0005;
        Einstein_HttpBodyPartTraining trainingPart = new Einstein_HttpBodyPartTraining(1L, 'MyTraining', 1, validLearningRate, null);
        
        // Execute
        Decimal result = trainingPart.getLearningRate();
        
        // Verify
        System.assertEquals(validLearningRate, result, 'The learningRate should be set correctly within valid range.');
    }

    @isTest
    static void testGetLearningRate_NotSet() {
        // Setup
        Einstein_HttpBodyPartTraining trainingPart = new Einstein_HttpBodyPartTraining(1L, 'MyTraining', 1, null, null);
        
        // Execute
        Decimal result = trainingPart.getLearningRate();
        
        // Verify
        System.assertEquals(null, result, 'The learningRate should not be set.');
    }

    @isTest
    static void testSetLearningRate_TooSmall() {
        // Setup
        Decimal tooSmallLearningRate = 0.00001; // Smaller than MIN_LEARNING_RATE
        Boolean isExceptionThrown = false;
        
        try {
            // Execute
            Einstein_HttpBodyPartTraining trainingPart = new Einstein_HttpBodyPartTraining(1L, 'MyTraining', 1, tooSmallLearningRate, null);
        } catch (Einstein_NumberTooSmallException e) {
            // Verify
            isExceptionThrown = true;
        }
        
        // Assert an exception was thrown
        System.assert(isExceptionThrown, 'An Einstein_NumberTooSmallException should have been thrown for a learningRate smaller than MIN_LEARNING_RATE.');
    }

    @isTest
    static void testSetLearningRate_TooBig() {
        // Setup
        Decimal tooBigLearningRate = 0.02; // Bigger than MAX_LEARNING_RAGE
        Boolean isExceptionThrown = false;
        
        try {
            // Execute
            Einstein_HttpBodyPartTraining trainingPart = new Einstein_HttpBodyPartTraining(1L, 'MyTraining', 1, tooBigLearningRate, null);
        } catch (Einstein_NumberTooBigException e) {
            // Verify
            isExceptionThrown = true;
        }
        
        // Assert an exception was thrown
        System.assert(isExceptionThrown, 'An Einstein_NumberTooBigException should have been thrown for a learningRate larger than MAX_LEARNING_RAGE.');
    }
}
