
@isTest
private class Einstein_HttpBodyPart_5_Tests {

    @testSetup
    static void setup() {
        // Prepare any test data if necessary
    }
    
    private static String decodeBase64(String base64) {
        blob data = EncodingUtil.base64Decode(base64);
        return data.toString();
    }
    
    @isTest
    static void testWriteBoundaryWithCrEnding() {
        // Given
        String expectedEnding = '\n--' + Einstein_HttpBodyPart.getBoundary() + '--';
        
        // When
        String boundaryBase64 = Einstein_HttpBodyPart.WriteBoundary(Einstein_HttpBodyPart.EndingType.Cr);
        
        // Then
        String decodedBoundary = decodeBase64(boundaryBase64);
        System.assertNotEquals(null, boundaryBase64, 'Boundary should not be null');
        System.assertEquals(expectedEnding, decodedBoundary, 'The decoded boundary should match expected for CR ending');
    }
    
    @isTest
    static void testWriteBoundaryWithNoneEnding() {
        // Given
        String expectedEnding = '\r\n--' + Einstein_HttpBodyPart.getBoundary() + '--';
        
        // When
        String boundaryBase64 = Einstein_HttpBodyPart.WriteBoundary(Einstein_HttpBodyPart.EndingType.None);
        
        // Then
        String decodedBoundary = decodeBase64(boundaryBase64);
        System.assertNotEquals(null, boundaryBase64, 'Boundary should not be null');
        System.assertEquals(expectedEnding, decodedBoundary, 'The decoded boundary should match expected for None ending');
    }
    
    @isTest
    static void testWriteBoundaryWithCrLfEnding() {
        // Given
        String expectedEnding = '--' + Einstein_HttpBodyPart.getBoundary() + '--'; // No prefix when CrLf
        
        // When
        String boundaryBase64 = Einstein_HttpBodyPart.WriteBoundary(Einstein_HttpBodyPart.EndingType.CrLf);
        
        // Then
        String decodedBoundary = decodeBase64(boundaryBase64);
        System.assertNotEquals(null, boundaryBase64, 'Boundary should not be null');
        System.assertEquals(expectedEnding, decodedBoundary, 'The decoded boundary should match expected for CrLf ending');
    }
}
