
@isTest
private class Einstein_BodyPartTest {

    // Utility method to create a valid instance of Einstein_HttpBodyPartFeedbackExample
    private static Einstein_HttpBodyPartFeedbackExample createValidHttpBodyPartFeedbackExample() {
        return new Einstein_HttpBodyPartFeedbackExample(
            'ValidName',
            'ExpectedLabel',
            'ModelId123',
            'DataString',
            Einstein_HttpBodyPartFeedbackExample.Types.BASE64
        );
    }

    // Happy Path
    @isTest
    static void shouldReturnExpectedLabel() {
        // Given
        Einstein_HttpBodyPartFeedbackExample instance = createValidHttpBodyPartFeedbackExample();

        // When
        String result = instance.getExpectedLabel();

        // Then
        System.assertEquals('ExpectedLabel', result, 'The expected label should be correctly retrieved.');
    }
}
