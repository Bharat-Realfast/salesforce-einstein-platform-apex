
@isTest
private class Einstein_PredictionService_5_Tests {

    @testSetup
    static void setup() {
        // No data setup required for these tests
    }

    @isTest
    static void testGetDatasetsReturnsResults() {
        // Mocking HTTP response for successful API call with datasets
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGeneratorWithData());

        // Act
        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.IMAGE);
        Einstein_Dataset[] result = service.getDatasets();

        // Assert
        System.assertNotEquals(null, result, 'The result should not be null');
        System.assert(result.size() > 0, 'The result should contain at least one dataset');
    }

    @isTest
    static void testGetDatasetsReturnsEmptyArray() {
        // Mocking HTTP response for successful API call with no datasets
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGeneratorWithNoData());

        // Act
        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.IMAGE);
        Einstein_Dataset[] result = service.getDatasets();

        // Assert
        System.assertNotEquals(null, result, 'The result should not be null even if there are no datasets');
        System.assertEquals(0, result.size(), 'The result should be an empty array');
    }

    @isTest
    static void testGetDatasetsApiCallFails() {
        // Mocking HTTP response for failed API call
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGeneratorWithError());

        // Act
        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.IMAGE);
        Einstein_Dataset[] result = service.getDatasets();

        // Assert
        System.assertEquals(null, result, 'The result should be null if the API call fails');
    }

    // Helper class to mock HTTP responses with data
    private class MockHttpResponseGeneratorWithData implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            // Create a fake response
            HTTPResponse res = new HTTPResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody('[{"id": 1, "type": "image", "status": "succeeded"}]');
            res.setStatusCode(200);
            return res;
        }
    }

    // Helper class to mock HTTP responses with no data
    private class MockHttpResponseGeneratorWithNoData implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            // Create a fake response
            HTTPResponse res = new HTTPResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody('[]');
            res.setStatusCode(200);
            return res;
        }
    }

    // Helper class to mock HTTP responses with error
    private class MockHttpResponseGeneratorWithError implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            // Create a fake response
            HTTPResponse res = new HTTPResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody('{"message": "Internal Server Error"}');
            res.setStatusCode(500);
            return res;
        }
    }
}
