
@isTest
private class Einstein_PlaygroundController_13_Tests {

    // Inner mock class to simulate the behavior of Einstein_PredictionService
    private class MockEinsteinPredictionService implements Einstein_PlaygroundController.Einstein_PredictionService {
        private Integer simulatedStatusCode;
        private String simulatedErrorMessage;
        private Einstein_PlaygroundController.Einstein_PredictionResult simulatedResult;

        public MockEinsteinPredictionService(Integer statusCode, Einstein_PlaygroundController.Einstein_PredictionResult result) {
            this.simulatedStatusCode = statusCode;
            this.simulatedResult = result;
            this.simulatedErrorMessage = (statusCode > 200) ? 'Error occurred' : null;
        }

        public Einstein_PlaygroundController.Einstein_PredictionResult detectImageBase64(String modelId, String base64, Integer numResults, String sampleId) {
            // Assigning the simulated status code and error message to the service instance
            Einstein_PlaygroundController.service.httpStatusCode = this.simulatedStatusCode;
            Einstein_PlaygroundController.service.httpErrorMessage = this.simulatedErrorMessage;

            // Return the simulated result or null based on the status code
            return (this.simulatedStatusCode <= 200) ? this.simulatedResult : null;
        }
    }

    private static void setUpMockService(Integer statusCode) {
        // Create a simulated result based on the status code
        Einstein_PlaygroundController.Einstein_PredictionResult result = (statusCode <= 200) ? 
            new Einstein_PlaygroundController.Einstein_PredictionResult() : null;

        // Instantiate the mock service with the given status code and simulated result
        Einstein_PlaygroundController.service = new MockEinsteinPredictionService(statusCode, result);
    }
    
    @isTest
    static void testPredictImageDetectionSuccess() {
        setUpMockService(200);
        
        String modelId = 'TestModelId';
        String base64 = 'TestBase64String';
        
        Test.startTest();
        Einstein_PlaygroundController.Einstein_PredictionResult result = Einstein_PlaygroundController.predictImageDetection(modelId, base64);
        Test.stopTest();
        
        System.assertNotEquals(null, result, 'The result should not be null for a successful prediction.');
        System.assertEquals(200, Einstein_PlaygroundController.service.httpStatusCode, 'Expected HTTP status code to be 200 for success.');
    }

    @isTest
    static void testPredictImageDetectionError() {
        setUpMockService(400);
        
        String modelId = 'TestModelId';
        String base64 = 'TestBase64String';
        
        Boolean exceptionThrown = false;
        Test.startTest();
        try {
            Einstein_PlaygroundController.predictImageDetection(modelId, base64);
        } catch (AuraHandledException e) {
            exceptionThrown = true;
        } finally {
            Test.stopTest();
        }
        
        System.assertTrue(exceptionThrown, 'An AuraHandledException should have been thrown due to an error response.');
        System.assertEquals(400, Einstein_PlaygroundController.service.httpStatusCode, 'Expected HTTP status code to be 400 for error.');
    }

    @isTest
    static void testPredictImageDetectionInvalidInput() {
        setUpMockService(200); // Set up mock service for success, but we'll pass invalid input
        
        String modelId = null; // Invalid modelId to trigger the exception
        String base64 = 'TestBase64String';
        
        Boolean exceptionThrown = false;
        Test.startTest();
        try {
            Einstein_PlaygroundController.predictImageDetection(modelId, base64);
        } catch (AuraHandledException e) {
            exceptionThrown = true;
        } finally {
            Test.stopTest();
        }
        
        System.assertTrue(exceptionThrown, 'An AuraHandledException should have been thrown due to invalid input.');
    }
}
