
@isTest
private class Einstein_PlaygroundController_3_Tests {

    // Implement the HttpCalloutMock interface to simulate HTTP callout response
    private class EinsteinServiceMock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            // Create a fake response
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody('{"success":true, "curves":"fakeLearningCurveData"}');
            res.setStatusCode(200);
            return res;
        }
    }

    @testSetup
    static void setup() {
        // Setup test data if needed
    }
    
    @isTest
    static void testGetLearningCurvesHappyPath() {
        // Set the mock callout class
        Test.setMock(HttpCalloutMock.class, new EinsteinServiceMock());
        
        // Assuming a valid modelId and dataType are "1" and "image" respectively
        String validModelId = '1';
        String validDataType = 'image';

        // Call the method under test
        Test.startTest();
        String result = Einstein_PlaygroundController.getLearningCurves(validModelId, validDataType);
        Test.stopTest();

        // Verify the behavior
        System.assertNotEquals(null, result, 'The learning curves data should not be null');
        System.assert(result.contains('fakeLearningCurveData'), 'The result should contain the fake learning curve data.');
    }

    @isTest
    static void testGetLearningCurvesInvalidModelId() {
        // Assume a valid dataType and an invalid modelId
        String validDataType = 'image';
        String invalidModelId = 'invalid';

        // Test
        Test.startTest();
        try {
            Einstein_PlaygroundController.getLearningCurves(invalidModelId, validDataType);
            System.fail('An exception should have been thrown due to invalid modelId');
        } catch (AuraHandledException e) {
            System.assert(e.getMessage().contains('Invalid request'), 'Expected AuraHandledException with specific message');
        }
        Test.stopTest();
    }

    @isTest
    static void testGetLearningCurvesInvalidDataType() {
        // Assume a valid modelId and an invalid dataType
        String validModelId = '1';
        String invalidDataType = 'invalid';

        // Test
        Test.startTest();
        try {
            Einstein_PlaygroundController.getLearningCurves(validModelId, invalidDataType);
            System.fail('An exception should have been thrown due to invalid dataType');
        } catch (AuraHandledException e) {
            System.assert(e.getMessage().contains('Invalid request'), 'Expected AuraHandledException with specific message');
        }
        Test.stopTest();
    }

    @isTest
    static void testGetLearningCurvesServiceError() {
        // Custom mock to simulate a service error
        Test.setMock(HttpCalloutMock.class, new HttpCalloutMock() {
            public HTTPResponse respond(HTTPRequest req) {
                HttpResponse res = new HttpResponse();
                res.setStatusCode(400); // Simulating a failure status code
                res.setBody('{"success":false, "error":"Invalid request"}');
                return res;
            }
        });
        
        String validModelId = '1';
        String validDataType = 'image';

        Test.startTest();
        try {
            Einstein_PlaygroundController.getLearningCurves(validModelId, validDataType);
            System.fail('An exception should have been thrown due to service error');
        } catch (AuraHandledException e) {
            System.assert(e.getMessage().contains('Invalid request'), 'Expected AuraHandledException with specific message');
        }
        Test.stopTest();
    }
}
