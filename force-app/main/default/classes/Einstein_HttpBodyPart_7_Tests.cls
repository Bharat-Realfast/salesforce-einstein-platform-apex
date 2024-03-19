
@isTest
private class Einstein_HttpBodyPart_7_Tests {
    
    @isTest
    static void testWriteBodyParameterHappyPath() {
        String key = 'testKey';
        String value = 'testValue';
        
        String result = Einstein_HttpBodyPart.WriteBodyParameter(key, value);
        
        // Assert the result is not null
        System.assertNotEquals(null, result, 'Result should not be null');
        
        // Since the result is base64 encoded, we need to decode it back to check the content
        Blob decodedBlob = EncodingUtil.base64Decode(result);
        String decodedString = decodedBlob.toString();
        
        // Assert the decoded content contains the key and value
        System.assert(decodedString.contains(key), 'Decoded result should contain the key');
        System.assert(decodedString.contains(value), 'Decoded result should contain the value');
    }
    
    @isTest
    static void testWriteBodyParameterNullKey() {
        String key = null;
        String value = 'testValue';
        
        // Testing a null key should be handled by the function or trigger an error
        String result = Einstein_HttpBodyPart.WriteBodyParameter(key, value);
        
        // Assert the result is not null
        System.assertNotEquals(null, result, 'Result should not be null even if the key is null.');
    }
    
    @isTest
    static void testWriteBodyParameterNullValue() {
        String key = 'testKey';
        String value = null;
        
        // Testing a null value should be handled by the function or trigger an error
        String result = Einstein_HttpBodyPart.WriteBodyParameter(key, value);
        
        // Assert the result is not null
        System.assertNotEquals(null, result, 'Result should not be null even if the value is null.');
    }
}
