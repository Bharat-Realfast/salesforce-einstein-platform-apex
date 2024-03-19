
@isTest
private class Einstein_HttpBodyPart_3_Tests {

    @isTest
    static void testSafelyPadWithoutPadding() {
        // Given a string that does not require padding
        String testValue = 'TestValue';
        String lineBreaks = '\r\n';
        Blob valueBlob = Blob.valueOf(testValue + lineBreaks);
        String base64Encoded = EncodingUtil.base64Encode(valueBlob);
        
        // When SafelyPad is called
        String result = Einstein_HttpBodyPart.SafelyPad(testValue, base64Encoded, lineBreaks);
        
        // Then the result should be the same as the input Base64 encoded string without padding
        System.assertEquals(base64Encoded, result, 'The Base64 encoded string should not change if no padding is needed.');
    }

    @isTest
    static void testSafelyPadWithPadding() {
        // Given a string that will result in padding when Base64 encoded
        String testValue = 'Pad ';
        String lineBreaks = '\r\n';
        Blob valueBlob = Blob.valueOf(testValue + lineBreaks);
        String base64Encoded = EncodingUtil.base64Encode(valueBlob);

        // When SafelyPad is called
        String result = Einstein_HttpBodyPart.SafelyPad(testValue, base64Encoded, lineBreaks);

        // Then the result should not end with padding character '='
        System.assert(!result.endsWith('='), 'Result should not end with padding character.');
    }

    @isTest
    static void testSafelyPadWithEmptyString() {
        // Given empty input parameters
        String testValue = '';
        String lineBreaks = '\r\n';
        // In this case, the method will pad until there is no '=' at the end
        // Since there is no initial Base64 string provided, we'll mimic the method's logic to find the expected result

        // When SafelyPad is called
        String result = Einstein_HttpBodyPart.SafelyPad(testValue, '', lineBreaks);

        // Then the result should not end with padding character '='
        System.assert(!result.endsWith('='), 'Result should not end with padding character for an empty string input.');
    }

    @isTest
    static void testSafelyPadWithVariousLineBreaks() {
        // Given a string that will result in padding when Base64 encoded with line breaks
        String testValue = 'LineBreakTest';
        String[] lineBreaksArray = new String[]{'\n', '\r\n'};
        
        for (String lineBreaks : lineBreaksArray) {
            Blob valueBlob = Blob.valueOf(testValue + lineBreaks);
            String base64Encoded = EncodingUtil.base64Encode(valueBlob);

            // When SafelyPad is called
            String result = Einstein_HttpBodyPart.SafelyPad(testValue, base64Encoded, lineBreaks);

            // Then the result should not end with padding character '='
            System.assert(!result.endsWith('='), 'Result should not end with padding character for line breaks: ' + lineBreaks);
        }
    }
}
