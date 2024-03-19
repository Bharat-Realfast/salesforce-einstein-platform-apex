
@isTest
public class Einstein_HttpBodyPartRetraining_1_Tests {

    // Util method to create a valid Einstein_HttpBodyPartRetraining instance
    private static Einstein_HttpBodyPartRetraining createValidBodyPart() {
        String modelId = 'validModelId';
        Integer epochs = 10;
        Decimal learningRate = 0.001;
        Einstein_TrainParams trainParams = new Einstein_TrainParams(); // Assuming a basic constructor
        return new Einstein_HttpBodyPartRetraining(modelId, epochs, learningRate, trainParams);
    }

    @isTest
    static void testBuildWithAllParameters() {
        Einstein_HttpBodyPartRetraining bodyPart = createValidBodyPart();
        Blob resultBlob = bodyPart.build();
        System.assertNotEquals(null, resultBlob, 'The Blob should not be null');
        System.assertNotEquals('', resultBlob.toString(), 'The Blob should contain data');
    }

    @isTest
    static void testBuildWithOptionalParametersNull() {
        Einstein_HttpBodyPartRetraining bodyPart = createValidBodyPart();
        bodyPart.setEpochs(null);
        bodyPart.setLearningRate(null);
        Blob resultBlob = bodyPart.build();
        System.assertNotEquals(null, resultBlob, 'The Blob should not be null when optional parameters are null');
    }

    @isTest
    static void testBuildWithEmptyModelId() {
        try {
            Einstein_HttpBodyPartRetraining bodyPart = new Einstein_HttpBodyPartRetraining(null, 10, 0.001, new Einstein_TrainParams());
            bodyPart.build();
            System.assert(false, 'Should have thrown an exception because the model ID is null');
        } catch (Einstein_StringIsEmptyException e) {
            System.assert(e.getMessage().contains('modelId'), 'The exception message should contain "modelId"');
        }
    }

    @isTest
    static void testBuildWithEpochsTooLarge() {
        try {
            Einstein_HttpBodyPartRetraining bodyPart = createValidBodyPart();
            bodyPart.setEpochs(101);
            bodyPart.build();
            System.assert(false, 'Should have thrown an exception because the number of epochs is too large');
        } catch (Einstein_NumberTooBigException e) {
            System.assert(e.getMessage().contains('epochs'), 'The exception message should contain "epochs"');
        }
    }

    @isTest
    static void testBuildWithInvalidLearningRate() {
        try {
            Einstein_HttpBodyPartRetraining bodyPart = createValidBodyPart();
            // Assuming the MIN_LEARNING_RATE is 0.0001 based on the original code
            Decimal hardcodedMinLearningRate = 0.0001;
            bodyPart.setLearningRate(hardcodedMinLearningRate - 0.00001);
            bodyPart.build();
            System.assert(false, 'Should have thrown an exception because the learning rate is too small');
        } catch (Einstein_NumberTooSmallException e) {
            System.assert(e.getMessage().contains('learningRate'), 'The exception message should contain "learningRate"');
        }
    }

    @isTest
    static void testBuildWithNullTrainParams() {
        Einstein_HttpBodyPartRetraining bodyPart = createValidBodyPart();
        bodyPart.setTrainParams(null);
        Blob resultBlob = bodyPart.build();
        System.assertNotEquals(null, resultBlob, 'The Blob should not be null when trainParams are null');
    }
}
