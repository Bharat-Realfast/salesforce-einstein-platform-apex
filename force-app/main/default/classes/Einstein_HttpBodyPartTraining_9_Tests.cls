
@isTest
private class Einstein_HttpBodyPartTraining_9_Tests {

    @isTest
    static void testSetLearningRateWithinValidRange() {
        Decimal validLearningRate = 0.005;
        Einstein_HttpBodyPartTraining training = new Einstein_HttpBodyPartTraining(1L, 'Test Name', 10, validLearningRate, null);

        Test.startTest();
        training.setLearningRate(validLearningRate);
        Test.stopTest();

        System.assertEquals(validLearningRate, training.getLearningRate(), 'The learning rate should be set correctly.');
    }

    @isTest
    static void testSetLearningRateToNull() {
        Einstein_HttpBodyPartTraining training = new Einstein_HttpBodyPartTraining(1L, 'Test Name', 10, 0.005, null);
        
        Test.startTest();
        training.setLearningRate(null);
        Test.stopTest();

        System.assertEquals(null, training.getLearningRate(), 'The learning rate should be null.');
    }

    @isTest
    static void testSetLearningRateBelowMinimum() {
        Decimal invalidLearningRate = 0.00001; // below minimum
        Einstein_HttpBodyPartTraining training = new Einstein_HttpBodyPartTraining(1L, 'Test Name', 10, 0.005, null);
        
        Boolean didThrowException = false;
        String exceptionMessage = '';
        
        try {
            Test.startTest();
            training.setLearningRate(invalidLearningRate);
            Test.stopTest();
        } catch (Einstein_NumberTooSmallException e) {
            didThrowException = true;
            exceptionMessage = e.getMessage();
        }

        System.assert(didThrowException, 'Setting learning rate below minimum should throw Einstein_NumberTooSmallException.');
        System.assert(exceptionMessage.contains('learningRate'), 'The exception message should contain the field name "learningRate".');
    }

    @isTest
    static void testSetLearningRateAboveMaximum() {
        Decimal invalidLearningRate = 0.02; // above maximum
        Einstein_HttpBodyPartTraining training = new Einstein_HttpBodyPartTraining(1L, 'Test Name', 10, 0.005, null);
        
        Boolean didThrowException = false;
        String exceptionMessage = '';
        
        try {
            Test.startTest();
            training.setLearningRate(invalidLearningRate);
            Test.stopTest();
        } catch (Einstein_NumberTooBigException e) {
            didThrowException = true;
            exceptionMessage = e.getMessage();
        }

        System.assert(didThrowException, 'Setting learning rate above maximum should throw Einstein_NumberTooBigException.');
        System.assert(exceptionMessage.contains('learningRate'), 'The exception message should contain the field name "learningRate".');
    }
}
