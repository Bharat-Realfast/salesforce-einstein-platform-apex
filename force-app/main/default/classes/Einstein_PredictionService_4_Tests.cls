
@isTest
private class Einstein_PredictionService_4_Tests {
    @testSetup
    static void setup() {
        // Setup test data if necessary
    }
    
    @isTest
    static void testGetGlobalDatasetsHappyPath() {
        Test.setMock(HttpCalloutMock.class, new Einstein_PredictionServiceMockHappyPath());
        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.IMAGE);

        Test.startTest();
        Einstein_Dataset[] datasets = service.getGlobalDatasets();
        Test.stopTest();

        System.assertNotEquals(null, datasets, 'Datasets should not be null on happy path.');
        System.assertNotEquals(0, datasets.size(), 'Datasets should not be empty on happy path.');
    }

    @isTest
    static void testGetGlobalDatasetsSadPath() {
        Test.setMock(HttpCalloutMock.class, new Einstein_PredictionServiceMockSadPath());
        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.IMAGE);

        Test.startTest();
        Einstein_Dataset[] datasets = service.getGlobalDatasets();
        Test.stopTest();

        System.assertNotEquals(null, datasets, 'Datasets should not be null on sad path.');
        System.assertEquals(0, datasets.size(), 'Datasets should be empty on sad path.');
    }

    @isTest
    static void testGetGlobalDatasetsExceptionalScenario() {
        Test.setMock(HttpCalloutMock.class, new Einstein_PredictionServiceMockExceptionalScenario());
        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.IMAGE);

        Test.startTest();
        Einstein_Dataset[] datasets = service.getGlobalDatasets();
        Test.stopTest();

        System.assertEquals(null, datasets, 'Datasets should be null when an error occurs.');
    }

    // Mock classes implementing HttpCalloutMock for separate scenarios
    // Happy path mock
    private class Einstein_PredictionServiceMockHappyPath implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody('[{"id": "1001", "name": "Dataset 1"}, {"id": "1002", "name": "Dataset 2"}]');
            res.setStatusCode(200);
            return res;
        }
    }

    // Sad path mock
    private class Einstein_PredictionServiceMockSadPath implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody('[]');
            res.setStatusCode(200);
            return res;
        }
    }

    // Exceptional scenario mock
    private class Einstein_PredictionServiceMockExceptionalScenario implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody('{"message": "An error occurred"}');
            res.setStatusCode(400);
            return res;
        }
    }
}
