
@isTest
private class Einstein_HttpBodyPartFB_Tests {

    @isTest
    static void testGetTypeBase64() {
        // Arrange
        Einstein_HttpBodyPartFeedbackExample instance = 
            new Einstein_HttpBodyPartFeedbackExample('name', 'label', 'modelId', 'data', Einstein_HttpBodyPartFeedbackExample.Types.BASE64);

        // Act
        Einstein_HttpBodyPartFeedbackExample.Types resultType = instance.getType();

        // Assert
        System.assertEquals(Einstein_HttpBodyPartFeedbackExample.Types.BASE64, resultType, 'The type should be BASE64');
    }

    @isTest
    static void testGetTypeDocument() {
        // Arrange
        Einstein_HttpBodyPartFeedbackExample instance = 
            new Einstein_HttpBodyPartFeedbackExample('name', 'label', 'modelId', 'data', Einstein_HttpBodyPartFeedbackExample.Types.DOCUMENT);

        // Act
        Einstein_HttpBodyPartFeedbackExample.Types resultType = instance.getType();

        // Assert
        System.assertEquals(Einstein_HttpBodyPartFeedbackExample.Types.DOCUMENT, resultType, 'The type should be DOCUMENT');
    }

    @isTest
    static void testGetTypeNull() {
        // Arrange
        Einstein_HttpBodyPartFeedbackExample instance = 
            new Einstein_HttpBodyPartFeedbackExample('name', 'label', 'modelId', 'data', null);

        // Act
        Einstein_HttpBodyPartFeedbackExample.Types resultType = instance.getType();

        // Assert
        System.assertEquals(null, resultType, 'The type should be null');
    }
}
