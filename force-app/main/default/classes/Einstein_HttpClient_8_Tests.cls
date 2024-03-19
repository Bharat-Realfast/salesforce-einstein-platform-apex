
@isTest
private class Einstein_HttpClient_8_Tests {

    // Mock HTTPResponse generator to simulate different HTTP status codes
    private class MockHttpResponseGenerator implements HttpCalloutMock {
        private Integer statusCode;

        public MockHttpResponseGenerator(Integer statusCode) {
            this.statusCode = statusCode;
        }

        public HTTPResponse respond(HTTPRequest request) {
            HTTPResponse response = new HTTPResponse();
            response.setStatusCode(this.statusCode);
            response.setBody('{}'); // Minimal valid JSON body
            return response;
        }
    }

    // Helper method to perform the setup for the HttpCalloutMock
    private static void setupMockHttpCallout(Integer statusCode) {
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(statusCode));
    }

    private static Einstein_HttpClient createEinsteinHttpClient() {
        // Assume there is a way to obtain an instance of Einstein_PredictionService, such as a service locator pattern or factory.
        // The actual implementation of this will depend on the codebase.
        Einstein_PredictionService predictionService = Einstein_PredictionServiceLocator.locateService();
        return new Einstein_HttpClient(predictionService, 'mockEndpoint');
    }

    @isTest
    static void testIsErrorFalseFor200() {
        // Arrange
        setupMockHttpCallout(200);
        Einstein_HttpClient client = createEinsteinHttpClient();

        // Act
        Test.startTest();
        client.execute();
        Test.stopTest();

        // Assert
        System.assertEquals(false, client.isError(), 'isError should be false when the status code is 200');
    }

    @isTest
    static void testIsErrorFalseFor204() {
        // Arrange
        setupMockHttpCallout(204);
        Einstein_HttpClient client = createEinsteinHttpClient();

        // Act
        Test.startTest();
        client.execute();
        Test.stopTest();

        // Assert
        System.assertEquals(false, client.isError(), 'isError should be false when the status code is 204');
    }

    @isTest
    static void testIsErrorTrueFor400() {
        // Arrange
        setupMockHttpCallout(400);
        Einstein_HttpClient client = createEinsteinHttpClient();

        // Act
        Test.startTest();
        client.execute();
        Test.stopTest();

        // Assert
        System.assertEquals(true, client.isError(), 'isError should be true when the status code is 400');
    }
}
