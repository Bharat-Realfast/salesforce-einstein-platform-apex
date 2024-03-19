
@isTest
private class Einstein_HttpBodyPart_6_Tests {

    @isTest
    static void testValidKeyAndValue() {
        String key = 'testKey';
        Integer value = 123;
        String result = Einstein_HttpBodyPart.WriteBodyParameter(key, value);
        System.assertNotEquals(null, result, 'The result should not be null');
        System.assert(result.contains(key), 'The result should contain the key');
    }

    @isTest
    static void testValidKeyAndZeroValue() {
        String key = 'testKey';
        Integer value = 0;
        String result = Einstein_HttpBodyPart.WriteBodyParameter(key, value);
        System.assertNotEquals(null, result, 'The result should not be null');
        System.assert(result.contains(key), 'The result should contain the key');
    }

    @isTest
    static void testValidKeyAndNegativeValue() {
        String key = 'testKey';
        Integer value = -1;
        String result = Einstein_HttpBodyPart.WriteBodyParameter(key, value);
        System.assertNotEquals(null, result, 'The result should not be null');
        System.assert(result.contains(key), 'The result should contain the key');
    }

    @isTest
    static void testNullKey() {
        Integer value = 123;
        Exception caughtException = null;

        try {
            String result = Einstein_HttpBodyPart.WriteBodyParameter(null, value);
        } catch (Exception e) {
            caughtException = e;
        }

        System.assertNotEquals(null, caughtException, 'An exception should have been thrown for null key');
    }

    @isTest
    static void testNullValue() {
        String key = 'testKey';
        Exception caughtException = null;

        try {
            // We need to convert the null integer to a string to avoid ambiguous method signature
            String result = Einstein_HttpBodyPart.WriteBodyParameter(key, (String)null);
        } catch (Exception e) {
            caughtException = e;
        }

        System.assertNotEquals(null, caughtException, 'An exception should have been thrown for null value');
    }
}
