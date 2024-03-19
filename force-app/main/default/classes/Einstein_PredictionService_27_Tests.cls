
@isTest
private class Einstein_PredictionService_27_Tests {

    // Mock class to simulate HTTP callout response
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

    @isTest
    static void testPredictImageUrlHappyPath() {
        // Set up the mock callout class
        String mockResponseBody = '{"probabilities":[{"label":"positive","probability":0.95}],"object":"predictresponse"}';
        MockHttpResponseGenerator mock = new MockHttpResponseGenerator(mockResponseBody, 200);
        Test.setMock(HttpCalloutMock.class, mock);

        Test.startTest();
        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.IMAGE);
        Einstein_PredictionResult result = service.predictImageUrl('validModelId', 'https://example.com/validImage.jpg', 1, 'sample1');
        Test.stopTest();

        // Assertions
        System.assertNotEquals(null, result, 'The result should not be null for a successful callout.');
    }

    @isTest
    static void testPredictImageUrlInvalidURL() {
        // Set up the mock callout class to simulate an error response
        String mockResponseBody = '{"message":"Invalid URL"}';
        MockHttpResponseGenerator mock = new MockHttpResponseGenerator(mockResponseBody, 400);
        Test.setMock(HttpCalloutMock.class, mock);

        Test.startTest();
        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.IMAGE);
        Einstein_PredictionResult result = service.predictImageUrl('validModelId', 'https://example.com/invalidUrl', 1, 'sample1');
        Test.stopTest();

        // Assertions
        System.assertEquals(null, result, 'The result should be null for an unsuccessful callout.');
    }

    @isTest
    static void testPredictImageUrlNullParameters() {
        // No need for a mock response since an exception is expected before the callout
        Boolean isExceptionThrown = false;
        Test.startTest();
        try {
            Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.IMAGE);
            service.predictImageUrl(null, null, 1, 'sample1');
        } catch (Exception e) {
            isExceptionThrown = true;
        }
        Test.stopTest();

        // Assertions
        System.assertEquals(true, isExceptionThrown, 'An exception should be thrown for null parameters.');
    }

    // Additional tests for other scenarios can be implemented as needed
}
