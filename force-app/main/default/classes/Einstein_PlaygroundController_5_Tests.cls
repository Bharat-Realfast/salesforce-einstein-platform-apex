
@isTest
private class Einstein_PlaygroundController_5_Tests {

    // Mock class to simulate the HttpCallout
    private class MyHttpCalloutMock implements HttpCalloutMock {
        private Integer statusCode;
        private String responseBody;

        public MyHttpCalloutMock(Integer statusCode, String responseBody) {
            this.statusCode = statusCode;
            this.responseBody = responseBody;
        }

        public HTTPResponse respond(HTTPRequest request) {
            HttpResponse response = new HttpResponse();
            response.setStatusCode(this.statusCode);
            response.setBody(this.responseBody);
            return response;
        }
    }

    @isTest
    static void testCreateDatasetFromUrl_Success() {
        String testUrl = 'http://example.com/dataset';
        String testDataType = 'image';

        // Mock a successful service call that would return a status code 200
        Test.setMock(HttpCalloutMock.class, new MyHttpCalloutMock(200, '{"success":true}'));

        Boolean isExceptionThrown = false;

        Test.startTest();
        try {
            Einstein_PlaygroundController.createDatasetFromUrl(testUrl, testDataType);
        } catch (Exception e) {
            isExceptionThrown = true;
        }
        Test.stopTest();
        
        // Assertions for happy path scenario
        System.assert(!isExceptionThrown, 'No exception should be thrown for a successful dataset creation');
    }
    
    @isTest
    static void testCreateDatasetFromUrl_HttpError() {
        String testUrl = 'http://example.com/dataset';
        String testDataType = 'image';

        // Mock a failed service call that would return a status code 400
        Test.setMock(HttpCalloutMock.class, new MyHttpCalloutMock(400, '{"success":false, "message":"Bad Request"}'));

        Boolean isExceptionThrown = false;

        Test.startTest();
        try {
            Einstein_PlaygroundController.createDatasetFromUrl(testUrl, testDataType);
        } catch (AuraHandledException e) {
            isExceptionThrown = true;
        }
        Test.stopTest();
        
        // Assertions for sad path scenario
        System.assert(isExceptionThrown, 'An AuraHandledException should have been thrown due to HTTP error');
    }

    @isTest
    static void testCreateDatasetFromUrl_InvalidDataType() {
        String testUrl = 'http://example.com/dataset';
        String testDataType = 'invalid-type';
        
        Boolean isExceptionThrown = false;

        Test.startTest();
        try {
            Einstein_PlaygroundController.createDatasetFromUrl(testUrl, testDataType);
        } catch (AuraHandledException e) {
            isExceptionThrown = true;
        }
        Test.stopTest();
        
        // Assertions for exceptional path scenario
        System.assert(isExceptionThrown, 'An AuraHandledException should have been thrown due to invalid data type');
    }
}
