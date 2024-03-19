
@isTest
private class Einstein_PredictionService_31_Tests {

    @testSetup
    static void setup() {
        // No specific setup needed for testing setType method.
    }

    @isTest
    static void testSetTypeImage() {
        Einstein_PredictionService serviceInstance = new Einstein_PredictionService(Einstein_PredictionService.Types.IMAGE);
        serviceInstance.setType(Einstein_PredictionService.Types.IMAGE);
        String expectedBaseUrl = 'https://api.einstein.ai/v2/vision';
        System.assertEquals(expectedBaseUrl, serviceInstance.baseUrl, 'The baseUrl should be correctly resolved for IMAGE.');
    }

    @isTest
    static void testSetTypeImageMultiLabel() {
        Einstein_PredictionService serviceInstance = new Einstein_PredictionService(Einstein_PredictionService.Types.IMAGE_MULTI_LABEL);
        serviceInstance.setType(Einstein_PredictionService.Types.IMAGE_MULTI_LABEL);
        String expectedBaseUrl = 'https://api.einstein.ai/v2/vision';
        System.assertEquals(expectedBaseUrl, serviceInstance.baseUrl, 'The baseUrl should be correctly resolved for IMAGE_MULTI_LABEL.');
    }

    @isTest
    static void testSetTypeImageDetection() {
        Einstein_PredictionService serviceInstance = new Einstein_PredictionService(Einstein_PredictionService.Types.IMAGE_DETECTION);
        serviceInstance.setType(Einstein_PredictionService.Types.IMAGE_DETECTION);
        String expectedBaseUrl = 'https://api.einstein.ai/v2/vision';
        System.assertEquals(expectedBaseUrl, serviceInstance.baseUrl, 'The baseUrl should be correctly resolved for IMAGE_DETECTION.');
    }

    @isTest
    static void testSetTypeSentiment() {
        Einstein_PredictionService serviceInstance = new Einstein_PredictionService(Einstein_PredictionService.Types.SENTIMENT);
        serviceInstance.setType(Einstein_PredictionService.Types.SENTIMENT);
        String expectedBaseUrl = 'https://api.einstein.ai/v2/language';
        System.assertEquals(expectedBaseUrl, serviceInstance.baseUrl, 'The baseUrl should be correctly resolved for SENTIMENT.');
    }

    @isTest
    static void testSetTypeIntent() {
        Einstein_PredictionService serviceInstance = new Einstein_PredictionService(Einstein_PredictionService.Types.INTENT);
        serviceInstance.setType(Einstein_PredictionService.Types.INTENT);
        String expectedBaseUrl = 'https://api.einstein.ai/v2/language';
        System.assertEquals(expectedBaseUrl, serviceInstance.baseUrl, 'The baseUrl should be correctly resolved for INTENT.');
    }

    @isTest
    static void testSetTypeNull() {
        Einstein_PredictionService serviceInstance = new Einstein_PredictionService(Einstein_PredictionService.Types.IMAGE); // Modified to create an instance with a non-null type first.
        serviceInstance.setType(null);
        String expectedBaseUrl = '';
        System.assertEquals(expectedBaseUrl, serviceInstance.baseUrl, 'The baseUrl should be an empty string when typeEnum is null.');
    }
}
