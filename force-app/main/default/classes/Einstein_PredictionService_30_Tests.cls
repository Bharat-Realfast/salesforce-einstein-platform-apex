
@isTest
public class Einstein_PredictionService_30_Tests {

    // Set up test data
    @testSetup
    static void setup() {
        // We don't need to set up any specific data for this test scenario
    }

    // Test method to verify isExecuting is set to true
    @isTest
    static void testIsExecutingTrue() {
        // Arrange
        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.INTENT);

        // Act
        service.isExecuting(true);

        // Assert
        System.assertEquals(true, service.isExecuting(), 'The isExecuting should be set to true');
    }

    // Test method to verify isExecuting is set to false
    @isTest
    static void testIsExecutingFalse() {
        // Arrange
        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.INTENT);

        // Act
        service.isExecuting(false);

        // Assert
        System.assertEquals(false, service.isExecuting(), 'The isExecuting should be set to false');
    }
}
