
@isTest
private class Einstein_HttpBodyPartDatasetUrl_2_Tests {

    // Since getUrl() is a simple getter method, we don't need any @testSetup data for this test class.

    // Test the happy path scenario where the url is set and retrieved successfully.
    @isTest
    static void testGetUrlSuccess() {
        // Given
        String expectedUrl = 'http://example.com/dataset';
        String type = 'MyType';
        Einstein_HttpBodyPartDatasetUrl part = new Einstein_HttpBodyPartDatasetUrl(expectedUrl, type);

        // When
        String actualUrl = part.getUrl();

        // Then
        System.assertEquals(expectedUrl, actualUrl, 'The URL should be the same as the one set in the constructor.');
    }

    // Test the exceptional scenario where an empty URL is passed to the constructor.
    @isTest
    static void testConstructorWithEmptyUrl() {
        String emptyUrl = '';
        String type = 'MyType';

        // Expect an exception to be thrown
        Boolean didThrowException = false;
        try {
            new Einstein_HttpBodyPartDatasetUrl(emptyUrl, type);
        } catch (Einstein_StringIsEmptyException e) {
            didThrowException = true;
        }

        // Verify that the exception was thrown
        System.assert(didThrowException, 'An exception should have been thrown for an empty URL.');
    }
}
