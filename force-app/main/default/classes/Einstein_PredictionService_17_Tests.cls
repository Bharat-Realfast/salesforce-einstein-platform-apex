
@isTest
private class Einstein_PredictionService_17_Tests {

    private static final String VALID_MODEL_ID = '12345';
    private static final String INVALID_MODEL_ID = 'invalidModelId';

    // Use this method to bypass trigger handlers for the unit tests
    private static void bypassTriggerHandlers() {
        // TriggerHandler.bypass('AccountTriggerHandler');
        // TriggerHandler.bypass('MDTAccountTriggerHandler');
        // The actual implementation will depend on the org's trigger handling framework
    }

    // Mock class to simulate the HTTP callout response
    private class Einstein_PredictionServiceMock implements HttpCalloutMock {
        private String responseBody;
        private Integer statusCode;

        public Einstein_PredictionServiceMock(String responseBody, Integer statusCode) {
            this.responseBody = responseBody;
            this.statusCode = statusCode;
        }

        public HTTPResponse respond(HTTPRequest request) {
            HttpResponse response = new HttpResponse();
            response.setBody(responseBody);
            response.setStatusCode(statusCode);
            return response;
        }
    }

    @isTest
    static void testGetModelLearningCurveWithValidModelId() {
        bypassTriggerHandlers();

        // Mock the expected response
        String expectedResponse = '{"modelId": "' + VALID_MODEL_ID + '", "status": "success"}';
        Test.setMock(HttpCalloutMock.class, new Einstein_PredictionServiceMock(expectedResponse, 200));
        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.INTENT);

        Test.startTest();
        String actualResponse = service.getModelLearningCurve(VALID_MODEL_ID);
        Test.stopTest();

        // Assertions
        System.assertNotEquals(null, actualResponse, 'The response should not be null for a valid model ID.');
        System.assertEquals(expectedResponse, actualResponse, 'The response should match the expected JSON string.');
    }

    @isTest
    static void testGetModelLearningCurveWithInvalidModelId() {
        bypassTriggerHandlers();

        // Mock the expected error response
        String expectedResponse = '{"error": "Invalid Model ID"}';
        Test.setMock(HttpCalloutMock.class, new Einstein_PredictionServiceMock(expectedResponse, 400));
        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.INTENT);

        Test.startTest();
        String actualResponse = service.getModelLearningCurve(INVALID_MODEL_ID);
        Test.stopTest();

        // Assertions
        System.assertEquals(null, actualResponse, 'The response should be null for an invalid model ID.');
        System.assertEquals(400, service.httpStatusCode, 'The status code should indicate client error.');
    }

    @isTest
    static void testGetModelLearningCurveWithEmptyModelId() {
        bypassTriggerHandlers();

        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.INTENT);

        Test.startTest();
        String actualResponse = service.getModelLearningCurve('');
        Test.stopTest();

        // Assertions
        System.assertEquals(null, actualResponse, 'The response should be null for an empty model ID.');
    }

    @isTest
    static void testGetModelLearningCurveWithNullModelId() {
        bypassTriggerHandlers();

        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.INTENT);

        Test.startTest();
        String actualResponse = service.getModelLearningCurve(null);
        Test.stopTest();

        // Assertions
        System.assertEquals(null, actualResponse, 'The response should be null for a null model ID.');
    }
}
