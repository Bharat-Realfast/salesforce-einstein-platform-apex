
@isTest
public class Einstein_PredictionService_22_Tests {

    @testSetup
    static void setup() {
        // Set up your test data here if needed
    }

    @isTest
    static void testDetectImageBase64_HappyPath() {
        // Mock the response to the API call
        Test.setMock(HttpCalloutMock.class, new MockHttpCallout());
        
        String modelId = 'Model123';
        String base64Image = 'iVBORw0...'; // A valid base64 image string for testing
        Integer numResults = 5;
        String sampleId = 'Sample123';
        
        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.IMAGE_DETECTION);
        
        Test.startTest();
        Einstein_PredictionResult result = service.detectImageBase64(modelId, base64Image, numResults, sampleId);
        Test.stopTest();

        // Assertions
        System.assertNotEquals(null, result, 'The prediction result should not be null');
        System.assertEquals(200, service.httpStatusCode, 'The HTTP status code should be 200');
    }

    // A mock class that implements HttpCalloutMock to simulate HTTP callout responses
    private class MockHttpCallout implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest request) {
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setBody('{"probabilities":[{"label":"sampleLabel","probability":0.95}],"object":"predictresponse"}');
            response.setHeader('Content-Type', 'application/json');
            return response;
        }
    }

    // Additional test methods should go here to handle different scenarios, both positive and negative cases...
}
