
@isTest
private class Einstein_HttpBodyPartTraining_10_Tests {

    @isTest
    static void testGetTrainParamsReturnsCorrectValue() {
        // Arrange
        Einstein_TrainParams mockTrainParams = new Einstein_TrainParams();
        Einstein_HttpBodyPartTraining httpBodyPartTraining = new Einstein_HttpBodyPartTraining(1L, 'TestTraining', 10, 0.001, mockTrainParams);
        
        // Act
        Einstein_TrainParams result = httpBodyPartTraining.getTrainParams();

        // Assert
        System.assertEquals(mockTrainParams, result, 'The getTrainParams method should return the set trainParams object');
    }
}
