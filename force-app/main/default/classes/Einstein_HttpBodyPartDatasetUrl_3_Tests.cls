
@isTest
private class Einstein_HttpBodyPartDatasetUrl_3_Tests {
    
    // Test setup to create test data which is not needed in this case as we are testing a simple setter method
    
    @isTest
    static void testSetUrlHappyPath() {
        // Given
        String validUrl = 'http://valid-url.com';
        Einstein_HttpBodyPartDatasetUrl instance = new Einstein_HttpBodyPartDatasetUrl(validUrl, 'type');

        // When
        instance.setUrl('http://new-valid-url.com');
        
        // Then
        System.assertEquals('http://new-valid-url.com', instance.getUrl(), 'URL should be set correctly.');
    }
    
    @isTest
    static void testSetUrlWithNull() {
        // Given
        String invalidUrl = null;
        Einstein_HttpBodyPartDatasetUrl instance = new Einstein_HttpBodyPartDatasetUrl('http://valid-url.com', 'type');
        
        try {
            // When
            instance.setUrl(invalidUrl);
            System.assert(false, 'Exception should have been thrown for null URL');
        } catch (Einstein_StringIsEmptyException e) {
            // Then
            System.assertEquals('url', e.getMessage(), 'Exception message should indicate the URL is empty');
        }
    }
    
    @isTest
    static void testSetUrlWithEmptyString() {
        // Given
        String invalidUrl = '';
        Einstein_HttpBodyPartDatasetUrl instance = new Einstein_HttpBodyPartDatasetUrl('http://valid-url.com', 'type');
        
        try {
            // When
            instance.setUrl(invalidUrl);
            System.assert(false, 'Exception should have been thrown for empty URL');
        } catch (Einstein_StringIsEmptyException e) {
            // Then
            System.assertEquals('url', e.getMessage(), 'Exception message should indicate the URL is empty');
        }
    }
}
