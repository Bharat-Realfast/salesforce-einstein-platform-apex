
@isTest
private class Einstein_HttpBodyPartTraining_6_Tests {

    @testSetup
    static void setup() {
        // No setup required for non-SObject testing
    }

    @isTest
    static void testGetEpochsWithValidValue() {
        Einstein_HttpBodyPartTraining trainingPart = new Einstein_HttpBodyPartTraining(1L, 'Training Name', 10, 0.001, null);
        Integer epochs = trainingPart.getEpochs();
        System.assertEquals(10, epochs, 'The epochs value should be as set in the constructor.');
    }

    @isTest
    static void testGetEpochsWithoutValue() {
        Einstein_HttpBodyPartTraining trainingPart = new Einstein_HttpBodyPartTraining(1L, 'Training Name', null, 0.001, null);
        Integer epochs = trainingPart.getEpochs();
        System.assertEquals(null, epochs, 'The epochs value should be null as it was not set.');
    }

    @isTest
    static void testGetEpochsWithTooLargeValue() {
        Exception numTooBigEx;
        try {
            Einstein_HttpBodyPartTraining trainingPart = new Einstein_HttpBodyPartTraining(1L, 'Training Name', 101, 0.001, null);
            System.assert(false, 'An Einstein_NumberTooBigException should have been thrown for epochs greater than 100.');
        } catch (Einstein_NumberTooBigException e) {
            numTooBigEx = e;
        }
        System.assertNotEquals(null, numTooBigEx, 'An Einstein_NumberTooBigException was expected but not thrown.');
    }
}
