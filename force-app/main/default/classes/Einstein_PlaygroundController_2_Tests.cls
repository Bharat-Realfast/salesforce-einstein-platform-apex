
@isTest
private class Einstein_PlaygroundController_2_Tests {
    
    // Mock implementation of HttpCalloutMock interface to simulate HTTP callouts
    private class MockHttpCallout implements HttpCalloutMock {
        private Integer statusCode;
        private String responseBody;

        public MockHttpCallout(Integer statusCode, String responseBody) {
            this.statusCode = statusCode;
            this.responseBody = responseBody;
        }

        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setStatusCode(this.statusCode);
            res.setBody(this.responseBody);
            return res;
        }
    }

    // Test the happy path where metrics are successfully retrieved
    @isTest
    static void testGetModelMetricsSuccess() {
        // Prepare mock response with successful metrics data
        String mockResponse = '{"success": true, "metrics": "mocked metrics"}';
        Test.setMock(HttpCalloutMock.class, new MockHttpCallout(200, mockResponse));

        String modelId = 'validModelId';
        String dataType = 'image';

        Test.startTest();
        String metrics = Einstein_PlaygroundController.getModelMetrics(modelId, dataType);
        Test.stopTest();

        System.assertNotEquals(null, metrics, 'Metrics should not be null');
    }

    // Test the sad path where an invalid modelId leads to an exception
    @isTest
    static void testGetModelMetricsInvalidModelId() {
        // Prepare mock response representing an error
        String mockErrorResponse = '{"success": false, "error": "Not Found", "errorCode": "NOT_FOUND"}';
        Test.setMock(HttpCalloutMock.class, new MockHttpCallout(404, mockErrorResponse));

        String modelId = 'invalidModelId';
        String dataType = 'image';

        Boolean exceptionThrown = false;

        Test.startTest();
        try {
            String metrics = Einstein_PlaygroundController.getModelMetrics(modelId, dataType);
        } catch (AuraHandledException e) {
            exceptionThrown = true;
        }
        Test.stopTest();

        System.assert(exceptionThrown, 'An AuraHandledException should have been thrown for invalid modelId');
    }

    // Additional test methods for different data types and their corresponding service types should go here
    // ...
}
