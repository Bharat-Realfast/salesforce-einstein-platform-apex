
@isTest
private class Einstein_PredictionService_18_Tests {

    // Mock class implementing HttpCalloutMock interface
    private class Einstein_PredictionServiceMock implements HttpCalloutMock {
        private final String response;
        private final Integer status;
        
        public Einstein_PredictionServiceMock(String response, Integer status) {
            this.response = response;
            this.status = status;
        }
        
        public HTTPResponse respond(HTTPRequest request) {
            HttpResponse response = new HttpResponse();
            response.setBody(this.response);
            response.setStatusCode(this.status);
            return response;
        }
    }

    @isTest
    static void testGetModelMetricsHappyPath() {
        // Setup mock response
        String jsonResponse = '{ "metrics": { "accuracy": 0.95, "precision": 0.9 } }';
        Test.setMock(HttpCalloutMock.class, new Einstein_PredictionServiceMock(jsonResponse, 200));

        // Given
        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.IMAGE);
        String modelId = '123456';

        // When
        Test.startTest();
        String metrics = service.getModelMetrics(modelId);
        Test.stopTest();

        // Then
        System.assertNotEquals(null, metrics, 'Metrics should not be null for a valid modelId.');
        System.assert(metrics.contains('accuracy'), 'Metrics should contain accuracy for a valid modelId.');
    }

    // Other test methods remain the same but need to be wrapped with Test.startTest() and Test.stopTest()
    // and include appropriate setMock calls for each scenario

}
