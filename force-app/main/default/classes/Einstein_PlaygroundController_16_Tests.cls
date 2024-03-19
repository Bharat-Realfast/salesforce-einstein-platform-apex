
@isTest
private class Einstein_PlaygroundController_16_Tests {
    
    // Mock class for HttpCalloutMock interface to simulate HTTP response
    private class Einstein_PredictionServiceMock implements HttpCalloutMock {
        private Integer mockStatusCode;
        private String mockResponseBody;
        
        public Einstein_PredictionServiceMock(Integer mockStatusCode, String mockResponseBody) {
            this.mockStatusCode = mockStatusCode;
            this.mockResponseBody = mockResponseBody;
        }
        
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setStatusCode(mockStatusCode);
            res.setBody(mockResponseBody);
            return res;
        }
    }
    
    // Happy path scenario test
    @isTest
    static void testPredictSentimentHappyPath() {
        // Given a mock response simulating a successful service call
        String mockResponseBody = '{"probabilities": [{"label":"positive", "probability":0.95}],"object":"predictresponse"}';
        Test.setMock(HttpCalloutMock.class, new Einstein_PredictionServiceMock(200, mockResponseBody));

        String modelId = 'testModelId';
        String phrase = 'The product is great';

        // Act
        Test.startTest();
        Einstein_PredictionResult result = Einstein_PlaygroundController.predictSentiment(modelId, phrase);
        Test.stopTest();

        // Assert
        System.assertNotEquals(null, result, 'The result should not be null.');
        System.assertEquals('positive', result.probabilities[0].label, 'The sentiment label should be positive.');
    }
    
    // Sad path scenario test
    @isTest
    static void testPredictSentimentSadPath() {
        // Given a mock response simulating a service call with an error
        String mockResponseBody = '{"message": "Error occurred"}';
        Test.setMock(HttpCalloutMock.class, new Einstein_PredictionServiceMock(400, mockResponseBody));

        String modelId = 'testModelId';
        String phrase = 'The product is great';

        // Act and Assert
        Test.startTest();
        try {
            Einstein_PlaygroundController.predictSentiment(modelId, phrase);
            System.assert(false, 'An exception should have been thrown due to an error response.');
        } catch (AuraHandledException e) {
            System.assert(true, 'An AuraHandledException was correctly thrown.');
        }
        Test.stopTest();
    }
    
    // Exceptional scenario handling null inputs test
    @isTest
    static void testPredictSentimentNullModelId() {
        // No mocking needed here since the method should fail before any callout is made

        String modelId = null;
        String phrase = 'valid phrase';

        // Act and Assert for null modelId
        try {
            Einstein_PlaygroundController.predictSentiment(modelId, phrase);
            System.assert(false, 'An exception should have been thrown due to null modelId.');
        } catch (Exception e) {
            System.assert(true, 'An exception was correctly thrown for null modelId.');
        }
    }

    @isTest
    static void testPredictSentimentNullPhrase() {
        // No mocking needed here since the method should fail before any callout is made

        String modelId = 'validModelId';
        String phrase = null;

        // Act and Assert for null phrase
        try {
            Einstein_PlaygroundController.predictSentiment(modelId, phrase);
            System.assert(false, 'An exception should have been thrown due to null phrase.');
        } catch (Exception e) {
            System.assert(true, 'An exception was correctly thrown for null phrase.');
        }
    }
}
