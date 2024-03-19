
@isTest
private class Einstein_PredictionService_19_Tests {

    private class MockHttpResponseGenerator implements HttpCalloutMock {
        private Integer statusCode;
        private String responseBody;

        public MockHttpResponseGenerator(Integer statusCode, String responseBody) {
            this.statusCode = statusCode;
            this.responseBody = responseBody;
        }

        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setStatusCode(this.statusCode);
            res.setBody(this.responseBody);
            res.setHeader('Content-Type', 'application/json');
            return res;
        }
    }

    private static void mockHttpResponse(Integer statusCode, String responseBody) {
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(statusCode, responseBody));
    }

    @isTest
    static void testGetModels_Successful() {
        String jsonResponse = '[{"modelId": "101", "status": "SUCCEEDED"}, {"modelId": "102", "status": "SUCCEEDED"}]';
        mockHttpResponse(200, jsonResponse);
        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.IMAGE);

        Test.startTest();
        Einstein_Model[] models = service.getModels(123L);
        Test.stopTest();

        System.assertNotEquals(null, models, 'The models array should not be null');
        System.assertEquals(2, models.size(), 'The models array should have 2 entries');
    }

    @isTest
    static void testGetModels_InvalidDatasetId() {
        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.IMAGE);

        Test.startTest();
        Exception thrownException = null;
        try {
            service.getModels(null);
        } catch (Exception e) {
            thrownException = e;
        }
        Test.stopTest();

        System.assertNotEquals(null, thrownException, 'An exception should have been thrown for the invalid datasetId');
        System.assert(thrownException instanceof Einstein_NoValuesException, 'The exception should be an instance of Einstein_NoValuesException');
    }

    @isTest
    static void testGetModels_HttpError() {
        mockHttpResponse(400, '{"message":"Bad request"}');
        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.IMAGE);

        Test.startTest();
        Einstein_Model[] models = service.getModels(123L);
        Test.stopTest();

        System.assertEquals(null, models, 'The models array should be null due to HTTP error');
        System.assertEquals(400, service.httpStatusCode, 'The httpStatusCode should be 400');
    }
}
