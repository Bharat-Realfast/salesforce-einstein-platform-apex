
@isTest
private class Einstein_HttpBodyPartPrediction_9_Tests {

    // Since the setType doesn't interact with the database or require specific setup, @testSetup is not needed

    private static void testSetTypeWithBase64() {
        // Arrange
        Einstein_HttpBodyPartPrediction prediction = new Einstein_HttpBodyPartPrediction('model123', 'data', 1, 'sample123', null);

        // Act
        prediction.setType(Einstein_HttpBodyPartPrediction.Types.BASE64);

        // Assert
        System.assertEquals(Einstein_HttpBodyPartPrediction.Types.BASE64, prediction.getType(), 'The type should be set to BASE64');
    }

    @isTest
    private static void testSetTypeWithFileBlob() {
        // Arrange
        Einstein_HttpBodyPartPrediction prediction = new Einstein_HttpBodyPartPrediction('model123', 'data', 1, 'sample123', null);

        // Act
        prediction.setType(Einstein_HttpBodyPartPrediction.Types.FILEBLOB);

        // Assert
        System.assertEquals(Einstein_HttpBodyPartPrediction.Types.FILEBLOB, prediction.getType(), 'The type should be set to FILEBLOB');
    }

    @isTest
    private static void testSetTypeWithURL() {
        // Arrange
        Einstein_HttpBodyPartPrediction prediction = new Einstein_HttpBodyPartPrediction('model123', 'data', 1, 'sample123', null);

        // Act
        prediction.setType(Einstein_HttpBodyPartPrediction.Types.URL);

        // Assert
        System.assertEquals(Einstein_HttpBodyPartPrediction.Types.URL, prediction.getType(), 'The type should be set to URL');
    }

    @isTest
    private static void testSetTypeWithDocument() {
        // Arrange
        Einstein_HttpBodyPartPrediction prediction = new Einstein_HttpBodyPartPrediction('model123', 'data', 1, 'sample123', null);

        // Act
        prediction.setType(Einstein_HttpBodyPartPrediction.Types.DOCUMENT);

        // Assert
        System.assertEquals(Einstein_HttpBodyPartPrediction.Types.DOCUMENT, prediction.getType(), 'The type should be set to DOCUMENT');
    }

    @isTest
    private static void testSetTypeWithNull() {
        // Arrange
        Einstein_HttpBodyPartPrediction prediction = new Einstein_HttpBodyPartPrediction('model123', 'data', 1, 'sample123', Einstein_HttpBodyPartPrediction.Types.BASE64);

        // Act
        prediction.setType(null);

        // Assert
        System.assertEquals(null, prediction.getType(), 'The type should be set to null');
    }
}
