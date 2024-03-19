
@isTest
private class Einstein_HttpBodyPart_4_Tests {
    
    @isTest
    static void testWriteBoundaryNotNullOrEmpty() {
        String boundaryBase64 = Einstein_HttpBodyPart.WriteBoundary();
        
        System.assertNotEquals(null, boundaryBase64, 'The boundary should not be null.');
        System.assertNotEquals('', boundaryBase64, 'The boundary should not be empty.');
    }
    
    @isTest
    static void testWriteBoundaryFormat() {
        String expectedBoundaryBase64 = EncodingUtil.base64Encode(Blob.valueOf('--' + Einstein_HttpBodyPart.getBoundary() + '\r\n'));
        String actualBoundaryBase64 = Einstein_HttpBodyPart.WriteBoundary();
        
        System.assertEquals(expectedBoundaryBase64, actualBoundaryBase64, 'The actual boundary does not match the expected boundary format.');
    }
}
