
@isTest
private class Einstein_PredictionService_25_Tests {

    // Mock class to simulate a successful HTTP response
    private class MockHttpSuccess implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setStatusCode(200);
            res.setBody('{"success":true,"predictions":[{"label":"testLabel","probability":0.95}]}');
            res.setHeader('Content-Type', 'application/json');
            return res;
        }
    }

    // Mock class to simulate an invalid JSON response from the service
    private class MockHttpInvalidJsonResponse implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setStatusCode(200);
            res.setBody('Invalid JSON Response'); // Not a valid JSON, would trigger a JSON parsing exception
            return res;
        }
    }
    
    // Happy Path Test
    @isTest
    static void testPredictImageBase64_HappyPath() {
        Test.setMock(HttpCalloutMock.class, new MockHttpSuccess());
        String accessTokenForTesting = 'mockAccessToken';
        Einstein_PredictionService service = new Einstein_PredictionService(accessTokenForTesting, Einstein_PredictionService.Types.IMAGE);
        String validModelId = 'validModelId';
        String validBase64 = 'validBase64String';
        Integer numResults = 3;
        String sampleId = 'sampleId';

        Test.startTest();
        Einstein_PredictionResult result = service.predictImageBase64(validModelId, validBase64, numResults, sampleId);
        Test.stopTest();

        // Assertion to check the result is not null indicating a response was received
        System.assertNotEquals(null, result, 'The result should not be null');
    }
    
    // Additional happy path and sad path test methods would go here...
    // ...

    // External Service Failure Test with Invalid JSON
    @isTest
    static void testPredictImageBase64_InvalidJsonResponse() {
        Test.setMock(HttpCalloutMock.class, new MockHttpInvalidJsonResponse());
        String accessTokenForTesting = 'mockAccessToken';
        Einstein_PredictionService service = new Einstein_PredictionService(accessTokenForTesting, Einstein_PredictionService.Types.IMAGE);
        String validModelId = 'validModelId';
        String validBase64 = 'validBase64String';
        Integer numResults = 3;
        String sampleId = 'sampleId';

        Boolean exceptionThrown = false;
        Test.startTest();
        try {
            service.predictImageBase64(validModelId, validBase64, numResults, sampleId);
        } catch (System.JSONException e) {
            exceptionThrown = true;
        }
        Test.stopTest();

        // Assert that a JSON exception was thrown
        System.assert(exceptionThrown, 'A System.JSONException was expected but not thrown.');
    }

    // ... Additional test methods with appropriate assertions ...
}
