
@isTest
private class Einstein_HttpBodyPartDatasetUrl_4_Tests {

    @isTest
    static void testGetTypeReturnsUrlInsteadOfType() {
        // Given
        String expectedUrl = 'testUrl';
        String inputType = 'testType'; // This value is ignored due to the incorrect implementation
        Einstein_HttpBodyPartDatasetUrl bodyPart = new Einstein_HttpBodyPartDatasetUrl(expectedUrl, inputType);

        // When
        String actualResult = bodyPart.getType();

        // Then
        System.assertEquals(expectedUrl, actualResult, 'The getType method is returning the URL value instead of the Type.');
    }
}
