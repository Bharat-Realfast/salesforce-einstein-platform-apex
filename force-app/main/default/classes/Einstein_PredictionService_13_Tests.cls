
@isTest
private class Einstein_PredictionService_13_Tests {

    @testSetup
    static void setup() {
        // Setup test data if required
    }

    @isTest
    static void testGetExamplesHappyPath() {
        // Given
        setupMock();
        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.IMAGE);

        // When
        Test.startTest();
        Einstein_Example[] examples = service.getExamples(1L, 5, 0, Einstein_Example.Types.ALL);
        Test.stopTest();

        // Then
        System.assertNotEquals(null, examples, 'Examples should not be null');
        System.assertEquals(5, examples.size(), 'Should return five examples');
    }

    @isTest
    static void testGetExamplesSadPathInvalidDatasetId() {
        // Given
        setupMock();
        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.IMAGE);
        
        Test.startTest();
        Exception caughtException = null;
        try {
            // When
            Einstein_Example[] examples = service.getExamples(null, 5, 0, Einstein_Example.Types.ALL);
        } catch (Exception e) {
            caughtException = e;
        } finally {
            Test.stopTest();
        }
        // Then
        System.assertNotEquals(null, caughtException, 'An exception should have been thrown due to invalid datasetId');
        System.assertEquals('Argument cannot be null', caughtException.getMessage(), 'Invalid datasetId should throw specific exception');
    }

    @isTest
    static void testGetExamplesExceptionalScenario() {
        // Given
        setupMock();
        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.IMAGE);
        
        Long invalidDatasetId = 0L; // This should throw an exception as per the target method implementation

        Test.startTest();
        Exception caughtException = null;
        try {
            // When
            Einstein_Example[] examples = service.getExamples(invalidDatasetId, 5, 0, Einstein_Example.Types.ALL);
        } catch (Einstein_NoValuesException e) {
            caughtException = e;
        } finally {
            Test.stopTest();
        }
        // Then
        System.assertNotEquals(null, caughtException, 'An exception should have been thrown due to invalid datasetId');
        System.assertEquals('datasetId', caughtException.getMessage(), 'Expected Einstein_NoValuesException for invalid datasetId');
    }

    // Helper method to setup mock response
    static void setupMock() {
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
    }

    // Mock class for HTTP callout
    private class MockHttpResponseGenerator implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody('[{"id": 1, "name": "Example 1"}]'); // Mock response data
            res.setStatusCode(200);
            return res;
        }
    }
}
