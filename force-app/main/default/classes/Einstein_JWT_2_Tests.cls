
@isTest
private class Einstein_JWT_2_Tests {

    @testSetup
    static void setup() {
        // Test setup, if needed, can go here.
    }
    
    @isTest
    static void testBase64URLencodeWithNonEmptyBlob() {
        // Arrange
        Einstein_JWT jwtInstance = new Einstein_JWT('none');
        String inputString = 'Salesforce Apex Unit Test';
        Blob inputBlob = Blob.valueOf(inputString);
        
        // Act
        String encodedString = jwtInstance.base64URLencode(inputBlob);
        
        // Assert
        System.assertNotEquals(null, encodedString, 'Encoded string should not be null.');
        System.assertEquals(encodedString.indexOf('+'), -1, 'Encoded String should not contain "+".');
        System.assertEquals(encodedString.indexOf('/'), -1, 'Encoded String should not contain "/".');
        System.assertEquals(encodedString.endsWith('='), false, 'Encoded String should not end with "=".');
    }
    
    @isTest
    static void testBase64URLencodeWithEmptyBlob() {
        // Arrange
        Einstein_JWT jwtInstance = new Einstein_JWT('none');
        Blob inputBlob = Blob.valueOf('');
        
        // Act
        String encodedString = jwtInstance.base64URLencode(inputBlob);
        
        // Assert
        System.assertEquals('', encodedString, 'Encoded string of an empty Blob should be an empty string.');
    }
    
    @isTest
    static void testBase64URLencodeWithNullBlob() {
        // Arrange
        Einstein_JWT jwtInstance = new Einstein_JWT('none');
        Blob inputBlob = null;
        
        // Act
        String encodedString;
        try {
            encodedString = jwtInstance.base64URLencode(inputBlob);
        } catch (Exception e) {
            encodedString = null;
        }
        
        // Assert
        System.assertEquals(null, encodedString, 'Encoded string of a null Blob should be null.');
    }
}
