
@isTest
private class Einstein_PlaygroundController_11_Tests {

    // Test the successful prediction scenario
    @isTest
    static void testPredictImageClassificationSuccess() {
        // Set up the mock response for the success scenario
        Test.setMock(HttpCalloutMock.class, new HttpCalloutMockResponse(200, 'Success', '{"probabilities": [{"label": "fakeLabel", "probability": 0.9}]}'));
        
        // Prepare input data for the method call
        String mockModelId = '12345';
        String base64Image = 'validBase64EncodedImageString';

        // Perform the test call
        Test.startTest();
        Einstein_PredictionResult result = Einstein_PlaygroundController.predictImageClassification(mockModelId, base64Image);
        Test.stopTest();

        // Assert the result is as expected
        System.assertNotEquals(null, result, 'The result should not be null.');
        // Additional assertions can be performed here based on the expected result
    }

    // Test the failure prediction scenario
    @isTest
    static void testPredictImageClassificationError() {
        // Set up the mock response for the failure scenario
        Test.setMock(HttpCalloutMock.class, new HttpCalloutMockResponse(400, 'Bad Request', '{"message":"Bad Request"}'));

        // Prepare input data for the method call
        String mockModelId = '12345';
        String base64Image = 'validBase64EncodedImageString';

        // Perform the test call that is expected to fail
        Test.startTest();
        try {
            Einstein_PlaygroundController.predictImageClassification(mockModelId, base64Image);
            System.assert(false, 'An exception should have been thrown due to the error status code.');
        } catch (AuraHandledException e) {
            System.assertEquals('Bad Request', e.getMessage(), 'The exception message should match the expected error message.');
        } finally {
            Test.stopTest();
        }
    }

    // Inner class to simulate HTTP callouts
    private class HttpCalloutMockResponse implements HttpCalloutMock {
        private Integer statusCode;
        private String status;
        private String body;

        public HttpCalloutMockResponse(Integer statusCode, String status, String body) {
            this.statusCode = statusCode;
            this.status = status;
            this.body = body;
        }

        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setStatusCode(this.statusCode);
            res.setStatus(this.status);
            res.setBody(this.body);
            return res;
        }
    }
}
