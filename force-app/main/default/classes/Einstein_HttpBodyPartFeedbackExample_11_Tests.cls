
@isTest
private class EinsteinBodyPartFbExTest {

    @isTest
    static void testSetTypeToBase64() {
        // Arrange
        Einstein_HttpBodyPartFeedbackExample instance = new Einstein_HttpBodyPartFeedbackExample(
            'testName', 'testLabel', 'testModelId', 'testData', Einstein_HttpBodyPartFeedbackExample.Types.DOCUMENT
        );
        
        // Act
        Test.startTest();
        instance.setType(Einstein_HttpBodyPartFeedbackExample.Types.BASE64);
        Test.stopTest();
        
        // Assert
        System.assertEquals(Einstein_HttpBodyPartFeedbackExample.Types.BASE64, instance.getType(), 'The type should be set to BASE64');
    }

    @isTest
    static void testSetTypeToDocument() {
        // Arrange
        Einstein_HttpBodyPartFeedbackExample instance = new Einstein_HttpBodyPartFeedbackExample(
            'testName', 'testLabel', 'testModelId', 'testData', Einstein_HttpBodyPartFeedbackExample.Types.BASE64
        );
        
        // Act
        Test.startTest();
        instance.setType(Einstein_HttpBodyPartFeedbackExample.Types.DOCUMENT);
        Test.stopTest();
        
        // Assert
        System.assertEquals(Einstein_HttpBodyPartFeedbackExample.Types.DOCUMENT, instance.getType(), 'The type should be set to DOCUMENT');
    }
}
