
@isTest
public class Einstein_HttpBodyPartTraining_3_Tests {

    @testSetup
    static void setup() {
        // No data setup required as we are testing methods that do not interact with the database.
    }
    
    @isTest
    static void shouldSetValidDatasetId() {
        // Given
        Long validDatasetId = 1L;
        Einstein_HttpBodyPartTraining trainingInstance = new Einstein_HttpBodyPartTraining(validDatasetId, 'TestName', 10, 0.005, null);

        // When
        trainingInstance.setDatasetId(validDatasetId);

        // Then
        Long actualDatasetId = trainingInstance.getDatasetId();
        System.assertEquals(validDatasetId, actualDatasetId, 'The datasetId should be set correctly to the given valid value.');
    }

    @isTest
    static void shouldThrowNoValuesExceptionForDatasetIdZero() {
        // Given
        Long invalidDatasetId = 0L;
        Einstein_HttpBodyPartTraining trainingInstance = new Einstein_HttpBodyPartTraining(1L, 'TestName', 10, 0.005, null);
        Boolean didThrowNoValuesException = false;

        // When
        try {
            trainingInstance.setDatasetId(invalidDatasetId);
        } catch (Einstein_NoValuesException e) {
            didThrowNoValuesException = true;
        }

        // Then
        System.assert(didThrowNoValuesException, 'An Einstein_NoValuesException should be thrown when datasetId is set to zero.');
    }
}
