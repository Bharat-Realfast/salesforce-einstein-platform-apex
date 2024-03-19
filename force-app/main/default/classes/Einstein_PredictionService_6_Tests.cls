
@isTest
private class Einstein_PredictionService_6_Tests {

    // Mock class to simulate the HTTP callouts
    private class MockHttpResponseGenerator implements HttpCalloutMock {
        private final String responseBody;
        private final Integer statusCode;

        public MockHttpResponseGenerator(String responseBody, Integer statusCode) {
            this.responseBody = responseBody;
            this.statusCode = statusCode;
        }

        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setBody(responseBody);
            res.setStatusCode(statusCode);
            return res;
        }
    }
    
    // Utility method to set up mock response
    private static void setupMockResponse(String responseBody, Integer statusCode) {
        MockHttpResponseGenerator mockResponse = new MockHttpResponseGenerator(responseBody, statusCode);
        Test.setMock(HttpCalloutMock.class, mockResponse);
    }

    // Happy Path Scenario 1
    @isTest
    static void testGetDatasetsValidResponse() {
        setupMockResponse('[{"id":1,"name":"Dataset 1"}]', 200);

        Test.startTest();
        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.IMAGE);
        Einstein_Dataset[] datasets = service.getDatasets(1, 0, Einstein_Dataset.Types.ALL);
        Test.stopTest();

        System.assertNotEquals(null, datasets, 'Datasets should not be null');
        System.assertEquals(1, datasets.size(), 'Should return one dataset');
    }

    // Happy Path Scenario 2
    @isTest
    static void testGetDatasetsEmptyResponse() {
        setupMockResponse('[]', 200);

        Test.startTest();
        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.IMAGE);
        Einstein_Dataset[] datasets = service.getDatasets(1, 0, Einstein_Dataset.Types.ALL);
        Test.stopTest();

        System.assertNotEquals(null, datasets, 'Datasets should not be null');
        System.assertEquals(0, datasets.size(), 'Should return empty list of datasets');
    }

    // Sad Path Scenario 1: Testing for negative count value
    @isTest
    static void testGetDatasetsNegativeCount() {
        Test.startTest();
        try {
            Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.IMAGE);
            service.getDatasets(-1, 0, Einstein_Dataset.Types.ALL);
            System.assert(false, 'Method did not throw an exception as expected.');
        } catch (Exception e) {
            System.assert(e instanceof Einstein_NoValuesException, 'Expected Einstein_NoValuesException has been thrown.');
        }
        Test.stopTest();
    }

    // Sad Path Scenario 2: Testing for negative offset value
    @isTest
    static void testGetDatasetsNegativeOffset() {
        Test.startTest();
        try {
            Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.IMAGE);
            service.getDatasets(1, -1, Einstein_Dataset.Types.ALL);
            System.assert(false, 'Method did not throw an exception as expected.');
        } catch (Exception e) {
            System.assert(e instanceof Einstein_NoValuesException, 'Expected Einstein_NoValuesException has been thrown.');
        }
        Test.stopTest();
    }
    
    // Exceptional Scenario
    @isTest
    static void testGetDatasetsExceptionScenario() {
        setupMockResponse('{"error": "Service Unavailable"}', 503);

        Test.startTest();
        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.IMAGE);
        Einstein_Dataset[] datasets = service.getDatasets(1, 0, Einstein_Dataset.Types.ALL);
        Test.stopTest();

        System.assertEquals(null, datasets, 'Datasets should be null on exception');
        System.assertNotEquals(0, service.httpStatusCode, 'HTTP status code should indicate an error');
        System.assertEquals(503, service.httpStatusCode, 'HTTP status code should be 503 for service unavailable');
    }
}
