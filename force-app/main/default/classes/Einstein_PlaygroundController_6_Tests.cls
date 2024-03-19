
@isTest
private class Einstein_PlaygroundController_6_Tests {
    
    // Mock class implementing HttpCalloutMock to simulate HTTP callouts
    private class MockEinsteinPredictionServiceCallout implements HttpCalloutMock {
        private String responseBody;
        private Integer statusCode;
        
        public MockEinsteinPredictionServiceCallout(String responseBody, Integer statusCode) {
            this.responseBody = responseBody;
            this.statusCode = statusCode;
        }
        
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setBody(this.responseBody);
            res.setStatusCode(this.statusCode);
            return res;
        }
    }

    // Test method for happy path scenario
    @isTest
    static void testGetDatasetsHappyPath() {
        // Prepare mock response
        String responseBody = '[{"type": "image"}]';
        Integer statusCode = 200;
        Test.setMock(HttpCalloutMock.class, new MockEinsteinPredictionServiceCallout(responseBody, statusCode));
        
        // Run the test
        Test.startTest();
        List<Einstein_Dataset> resultDatasets = Einstein_PlaygroundController.getDatasets('image');
        Test.stopTest();
        
        // Assertions
        System.assertNotEquals(null, resultDatasets, 'The result should not be null');
        System.assertEquals(1, resultDatasets.size(), 'There should be one dataset returned');
        System.assertEquals('image', resultDatasets[0].type, 'The dataset type should be "image"');
    }
    
    // Additional test methods for sad path and exception path would follow the same pattern,
    // by setting up appropriate mock responses
}
