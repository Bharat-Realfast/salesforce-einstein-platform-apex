
@isTest
private class EinsteinHttpBodyPartFbTest {

    @testSetup
    static void setup() {
        // No test data setup required for testing a getter method.
    }

    @isTest
    static void shouldReturnData() {
        // Given
        Einstein_HttpBodyPartFeedbackExample testInstance = new Einstein_HttpBodyPartFeedbackExample(
            'TestName',
            'ExpectedLabel',
            'ModelId',
            'TestData',
            Einstein_HttpBodyPartFeedbackExample.Types.BASE64
        );

        // When
        String actualData = testInstance.getData();

        // Then
        System.assertEquals('TestData', actualData, 'The data should match the value set in the constructor.');
    }
}
