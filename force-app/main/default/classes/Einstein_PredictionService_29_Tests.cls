
@isTest
private class Einstein_PredictionService_29_Tests {

    @testSetup
    static void setup() {
        // Typically, we would create test data here, but since isExecuting() does not rely on any data, we do not need to set up any data.
    }
    
    @isTest
    static void IsExecutingReturnsFalse() {
        // Given
        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.INTENT);

        // When
        boolean result = service.isExecuting();

        // Then
        System.assertEquals(false, result, 'isExecuting should return false when no operation is in progress.');
    }

    @isTest
    static void IsExecutingReturnsTrue() {
        // Given
        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.INTENT);
        Test.startTest();
        service.isExecuting(true); // Simulate the start of an operation
        Test.stopTest();

        // When
        boolean result = service.isExecuting();

        // Then
        System.assertEquals(true, result, 'isExecuting should return true when an operation is in progress.');
    }
}
