
@isTest
private class Einstein_PlaygroundController_4_Tests {

    // Mock HTTP Callout class
    private class MockHttpCallout implements HttpCalloutMock {
        private Integer statusCode;
        private String body;
        
        public MockHttpCallout(Integer statusCode, String body) {
            this.statusCode = statusCode;
            this.body = body;
        }
        
        public HTTPResponse respond(HTTPRequest req) {
            HTTPResponse res = new HTTPResponse();
            res.setStatusCode(statusCode);
            res.setBody(body);
            return res;
        }
    }
    
    // Happy path scenario: Simulate a successful API usage callout
    @isTest
    static void testGetUsageSuccess() {
        // Mock JSON response for API usage
        String jsonResponse = '[{"apiName": "Test Usage", "apiCount": 100}]';
        
        // Set mock callout with successful response
        Test.setMock(HttpCalloutMock.class, new MockHttpCallout(200, jsonResponse));
        
        Test.startTest();
        List<Einstein_ApiUsage> result = Einstein_PlaygroundController.getUsage();
        Test.stopTest();
        
        // Assertions
        System.assertNotEquals(null, result, 'Result should not be null');
        System.assert(result.size() > 0, 'Usage list should not be empty');
    }

    // Sad path scenario: Simulate a failed API usage callout
    @isTest
    static void testGetUsageThrowsException() {
        // Mock JSON response for API usage error
        String jsonResponse = '{}';
        
        // Set mock callout with error response
        Test.setMock(HttpCalloutMock.class, new MockHttpCallout(400, jsonResponse));
        
        Boolean exceptionThrown = false;
        Test.startTest();
        try {
            Einstein_PlaygroundController.getUsage();
        } catch (AuraHandledException e) {
            exceptionThrown = true;
            // The exception message might differ in the actual code depending on how the AuraHandledException is constructed
        }
        Test.stopTest();
        
        System.assert(exceptionThrown, 'An AuraHandledException should have been thrown');
    }
}
