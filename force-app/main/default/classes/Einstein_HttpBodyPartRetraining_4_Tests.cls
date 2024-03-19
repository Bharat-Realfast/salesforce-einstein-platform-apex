
@isTest
private class Einstein_HttpBodyPartRetraining_4_Tests {

    @isTest
    static void testGetEpochsWithValidEpochs() {
        // Given a valid number of epochs
        Einstein_HttpBodyPartRetraining partRetraining = new Einstein_HttpBodyPartRetraining('model123', 50, 0.0005, null);

        // When retrieving epochs
        Integer epochs = partRetraining.getEpochs();

        // Then the correct number of epochs should be returned
        System.assertEquals(50, epochs, 'The epochs should match the initialized value.');
    }

    @isTest
    static void testGetEpochsWithUninitializedEpochs() {
        // Given an uninitialized epochs value
        Einstein_HttpBodyPartRetraining partRetraining = new Einstein_HttpBodyPartRetraining('model123', null, 0.0005, null);

        // When retrieving epochs
        Integer epochs = partRetraining.getEpochs();

        // Then null should be returned
        System.assertEquals(null, epochs, 'The epochs should be null as it was uninitialized.');
    }

    @isTest
    static void testGetEpochsWithZeroEpochs() {
        // Given epochs set to zero
        Einstein_HttpBodyPartRetraining partRetraining = new Einstein_HttpBodyPartRetraining('model123', 0, 0.0005, null);

        // When retrieving epochs
        Integer epochs = partRetraining.getEpochs();

        // Then zero should be returned
        System.assertEquals(0, epochs, 'The epochs should be zero as it was set to zero.');
    }

    @isTest
    static void testGetEpochsWithTooManyEpochs() {
        Boolean didThrow = false;

        try {
            // Given a number of epochs greater than 100
            Einstein_HttpBodyPartRetraining partRetraining = new Einstein_HttpBodyPartRetraining('model123', 101, 0.0005, null);

            // This should throw an exception
            partRetraining.getEpochs();
        } catch (Einstein_NumberTooBigException e) {
            didThrow = true;
        }

        // Then an exception should be thrown
        System.assert(didThrow, 'An Einstein_NumberTooBigException should have been thrown for epochs greater than 100.');
    }

}
