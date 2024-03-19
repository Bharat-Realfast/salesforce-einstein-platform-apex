
@isTest
private class Einstein_HttpBodyPartTraining_7_Tests {

    @isTest
    static void testSetEpochsWithValidValue() {
        Integer validEpochs = 50;
        Einstein_HttpBodyPartTraining trainingPart = new Einstein_HttpBodyPartTraining(1L, 'Valid Name', validEpochs, 0.005, null);
        System.assertEquals(validEpochs, trainingPart.getEpochs(), 'The epochs should be set to the valid value provided.');
    }

    @isTest
    static void testSetEpochsWithTooBigValue() {
        Integer tooBigEpochs = 101;
        Exception ex = null;
        try {
            Einstein_HttpBodyPartTraining trainingPart = new Einstein_HttpBodyPartTraining(1L, 'Valid Name', tooBigEpochs, 0.005, null);
        } catch (Einstein_NumberTooBigException e) {
            ex = e;
        }
        System.assertNotEquals(null, ex, 'An Einstein_NumberTooBigException should be thrown when epochs is greater than 100.');
    }

    @isTest
    static void testSetEpochsWithNullOrZero() {
        Integer nullEpochs = null;
        Integer zeroEpochs = 0;
        Einstein_HttpBodyPartTraining trainingPartWithNull = new Einstein_HttpBodyPartTraining(1L, 'Valid Name', nullEpochs, 0.005, null);
        Einstein_HttpBodyPartTraining trainingPartWithZero = new Einstein_HttpBodyPartTraining(1L, 'Valid Name', zeroEpochs, 0.005, null);

        // Assuming build() method returns a non-base64 encoded Blob which can be converted to a String directly.
        String bodyWithNullEpochs = trainingPartWithNull.build().toString();
        String bodyWithZeroEpochs = trainingPartWithZero.build().toString();

        // Assert that 'epochs' parameter isn't part of the request body for null or zero epochs
        System.assertNotContains(bodyWithNullEpochs, 'epochs', 'The body should not contain the epochs parameter when it is set to null.');
        System.assertNotContains(bodyWithZeroEpochs, 'epochs', 'The body should not contain the epochs parameter when it is set to 0.');
    }
}
