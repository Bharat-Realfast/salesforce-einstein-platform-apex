
@isTest
private class Einstein_PlaygroundController_8_Tests {

    private class Einstein_PredictionServiceMock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest request) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody('{"modelId": "ModelId123"}');
            res.setStatusCode(200);
            return res;
        }
    }
    
    @testSetup
    static void setup() {
        // Test data setup if needed
    }

    @isTest
    static void testTrainDatasetHappyPath() {
        Test.setMock(HttpCalloutMock.class, new Einstein_PredictionServiceMock());

        Decimal datasetId = 123; // Dummy ID for testing
        String modelName = 'TestModel';
        String dataType = 'image';

        Test.startTest();
        String result = Einstein_PlaygroundController.trainDataset(datasetId, modelName, dataType);
        Test.stopTest();

        System.assertNotEquals(null, result, 'The result should not be null');
        System.assertEquals('ModelId123', result, 'The modelId should match the expected value');
    }

    @isTest
    static void testTrainDatasetInvalidDataset() {
        Test.setMock(HttpCalloutMock.class, new Einstein_PredictionServiceMock());
        
        Decimal datasetId = -1; // Invalid ID
        String modelName = 'TestModel';
        String dataType = 'image';

        Boolean didThrowException = false;
        
        Test.startTest();
        try {
            Einstein_PlaygroundController.trainDataset(datasetId, modelName, dataType);
        } catch (AuraHandledException e) {
            didThrowException = true;
        }
        Test.stopTest();

        System.assert(didThrowException, 'An exception should have been thrown due to invalid dataset ID');
    }

    @isTest
    static void testTrainDatasetInvalidDataType() {
        Test.setMock(HttpCalloutMock.class, new Einstein_PredictionServiceMock());
        
        Decimal datasetId = 123; // Valid ID
        String modelName = 'TestModel';
        String dataType = 'invalid_type';

        Boolean didThrowException = false;

        Test.startTest();
        try {
            Einstein_PlaygroundController.trainDataset(datasetId, modelName, dataType);
        } catch (AuraHandledException e) {
            didThrowException = true;
        }
        Test.stopTest();

        System.assert(didThrowException, 'An exception should have been thrown due to invalid data type');
    }

    @isTest
    static void testTrainDatasetServiceError() {
        Test.setMock(HttpCalloutMock.class, new Einstein_PredictionServiceMock() {
            public HTTPResponse respond(HTTPRequest request) {
                HttpResponse res = new HttpResponse();
                res.setHeader('Content-Type', 'application/json');
                res.setBody('{"message": "Internal Server Error"}');
                res.setStatusCode(500);
                return res;
            }
        });
        
        Decimal datasetId = 123; // Valid ID
        String modelName = 'TestModel';
        String dataType = 'image';

        Boolean didThrowException = false;

        Test.startTest();
        try {
            Einstein_PlaygroundController.trainDataset(datasetId, modelName, dataType);
        } catch (AuraHandledException e) {
            didThrowException = true;
        }
        Test.stopTest();

        System.assert(didThrowException, 'An exception should have been thrown due to service error');
    }
}
