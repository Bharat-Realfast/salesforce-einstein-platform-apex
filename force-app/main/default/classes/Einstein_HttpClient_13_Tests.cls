
@isTest
private class Einstein_HttpClient_13_Tests {
    
    @testSetup
    static void setup() {
        // Bypassing triggers as per project-specific details
        TriggerHandler.bypass('AccountTriggerHandler');
        TriggerHandler.bypass('MDTAccountTriggerHandler');
    }
    
    private class MockEinstein_PredictionService {
        public String baseUrl = 'http://mockservice.com/';
        
        public MockEinstein_PredictionService() {
            // Empty constructor for test
        }
        
        public String getBearerToken() {
            return 'mockToken';
        }

        public void isExecuting(Boolean value) {
            // Stub method for test purposes
        }
    }
    
    @isTest
    static void testGetParserWithValidResponse() {
        // Mock a valid HTTP response
        HttpMockResponseGenerator mockResponseGen = new HttpMockResponseGenerator(200, 'OK', '{"data": "test"}');
        Test.setMock(HttpCalloutMock.class, mockResponseGen);
        
        MockEinstein_PredictionService mockPredictionService = new MockEinstein_PredictionService();
        Einstein_HttpClient client = new Einstein_HttpClient(mockPredictionService, 'example');
        
        Test.startTest();
        client.execute();
        Test.stopTest();
        
        JSONParser parser = client.getParser();
        System.assertNotEquals(null, parser, 'Parser should not be null with a valid response');
        
        // Parse through the JSON to verify the parser was correctly initialized
        Boolean hasDataField = false;
        while (parser.nextToken() != null) {
            if (parser.getCurrentToken() == JSONToken.FIELD_NAME && 'data'.equals(parser.getText())) {
                hasDataField = true;
                break;
            }
        }
        System.assert(hasDataField, 'The JSON parser should find the "data" field in the response');
    }
    
    @isTest
    static void testGetParserWithInvalidResponse() {
        // Mock an invalid (non-JSON) HTTP response
        HttpMockResponseGenerator mockResponseGen = new HttpMockResponseGenerator(200, 'OK', 'Not a JSON response');
        Test.setMock(HttpCalloutMock.class, mockResponseGen);
        
        MockEinstein_PredictionService mockPredictionService = new MockEinstein_PredictionService();
        Einstein_HttpClient client = new Einstein_HttpClient(mockPredictionService, 'example');
        
        Test.startTest();
        client.execute();
        Test.stopTest();
        
        System.assert(client.isError(), 'There should be an error due to invalid JSON response');
        System.assertEquals('Could not read JSON data', client.getResponseError(), 'Error message should match expected');
    }
    
    @isTest
    static void testGetParserWithoutExecution() {
        MockEinstein_PredictionService mockPredictionService = new MockEinstein_PredictionService();
        Einstein_HttpClient client = new Einstein_HttpClient(mockPredictionService, 'example');
        
        JSONParser parser = client.getParser();
        System.assertEquals(null, parser, 'Parser should be null if execute() has not been called');
    }
    
    // Helper class to generate mock responses
    private class HttpMockResponseGenerator implements HttpCalloutMock {
        private Integer statusCode;
        private String status;
        private String body;
        
        public HttpMockResponseGenerator(Integer statusCode, String status, String body) {
            this.statusCode = statusCode;
            this.status = status;
            this.body = body;
        }
        
        public HTTPResponse respond(HTTPRequest request) {
            HTTPResponse response = new HTTPResponse();
            response.setStatusCode(statusCode);
            response.setStatus(status);
            response.setBody(body);
            return response;
        }
    }
}
