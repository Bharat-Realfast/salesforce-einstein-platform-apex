
@isTest
private class Einstein_PredictionService_8_Tests {

    @testSetup
    static void setup() {
        // Test setup code goes here
    }
    
    @isTest
    static void testCreateExample_HappyPath() {
        // Mock the HTTP callout response for a successful request
        Test.setMock(HttpCalloutMock.class, new MockHttpCalloutSuccess());

        // Instantiate the Einstein_PredictionService class
        Einstein_PredictionService service = new Einstein_PredictionService('DummyToken', Einstein_PredictionService.Types.IMAGE);

        // Call the method we want to test
        Test.startTest();
        Einstein_Example result = service.createExample(1L, 'TestName', 1L, Blob.valueOf('TestBlob'));
        Test.stopTest();

        // Perform our assertions
        System.assertNotEquals(null, result, 'The result should not be null.');
        System.assertEquals('TestName', result.name, 'The example name should match the input.');
    }
    
    // Mock class to simulate the HttpCallout response for successful request
    private class MockHttpCalloutSuccess implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest request) {
            // Create a fake successful HTTP response
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setBody('{"id": 1, "name": "TestName"}');
            response.setHeader('Content-Type', 'application/json');
            return response;
        }
    }
}
