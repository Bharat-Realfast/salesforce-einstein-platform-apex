
@isTest
private class Einstein_HttpBodyPart_2_Tests {

    @isTest
    static void testGetContentType() {
        // Act
        String contentTypeResult = Einstein_HttpBodyPart.GetContentType();

        // Assert
        String expectedContentType = 'multipart/form-data; charset="UTF-8"; boundary="1ff13444ed8140c7a32fc4e6451aa76d"';
        System.assertEquals(expectedContentType, contentTypeResult, 'The content type should match the expected format with the correct boundary.');
    }
}
