
@isTest
private class Einstein_BodyPartFb7_Tests {

    @isTest
    static void shouldSetModelIdWithValidInput() {
        // Arrange
        Einstein_HttpBodyPartFeedbackExample bodyPart = new Einstein_HttpBodyPartFeedbackExample('name', 'label', 'originalModelId', 'data', Einstein_HttpBodyPartFeedbackExample.Types.BASE64);

        // Act
        bodyPart.setModelId('newModelId');

        // Assert
        String actualModelId = bodyPart.getModelId();
        System.assertEquals('newModelId', actualModelId, 'The modelId should be set to newModelId');
    }

    @isTest
    static void shouldThrowExceptionForNullModelId() {
        // Arrange
        Einstein_HttpBodyPartFeedbackExample bodyPart = new Einstein_HttpBodyPartFeedbackExample('name', 'label', 'originalModelId', 'data', Einstein_HttpBodyPartFeedbackExample.Types.BASE64);
        String nullModelId = null;

        // Act & Assert
        Boolean caughtException = false;
        try {
            bodyPart.setModelId(nullModelId);
        } catch (Einstein_StringIsEmptyException e) {
            caughtException = true;
        }
        
        System.assertTrue(caughtException, 'An exception should have been thrown for null modelId');
    }

    @isTest
    static void shouldThrowExceptionForEmptyModelId() {
        // Arrange
        Einstein_HttpBodyPartFeedbackExample bodyPart = new Einstein_HttpBodyPartFeedbackExample('name', 'label', 'originalModelId', 'data', Einstein_HttpBodyPartFeedbackExample.Types.BASE64);
        String emptyModelId = '';

        // Act & Assert
        Boolean caughtException = false;
        try {
            bodyPart.setModelId(emptyModelId);
        } catch (Einstein_StringIsEmptyException e) {
            caughtException = true;
        }

        System.assertTrue(caughtException, 'An exception should have been thrown for empty modelId');
    }
}
