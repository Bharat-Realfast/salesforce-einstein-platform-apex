
@isTest
private class Einstein_HttpBodyPartDatasetUrl_5_Tests {

    // Helper method to create a valid instance
    private static Einstein_HttpBodyPartDatasetUrl createValidInstance() {
        return new Einstein_HttpBodyPartDatasetUrl('http://valid.url', 'image');
    }

    @isTest
    static void testSetTypeWithNonEmptyString() {
        Einstein_HttpBodyPartDatasetUrl instance = createValidInstance();
        String expectedType = 'text';
        Test.startTest();
        instance.setType(expectedType);
        Test.stopTest();

        String actualType = instance.getType();
        System.assertEquals(expectedType, actualType, 'The type should be set correctly for non-empty strings.');
    }

    @isTest
    static void testSetTypeWithEmptyString() {
        Einstein_HttpBodyPartDatasetUrl instance = createValidInstance();
        String emptyType = '';
        String exceptionMessage = 'No exception thrown for empty strings';

        Exception actualException = null;
        try {
            instance.setType(emptyType);
        } catch (Einstein_StringIsEmptyException e) {
            actualException = e;
        }

        System.assertNotEquals(null, actualException, exceptionMessage);
        if (actualException != null) {
            System.assertEquals('type', actualException.getMessage(), 'The exception message should match the expected for empty strings');
        }
    }

    @isTest
    static void testSetTypeWithNull() {
        Einstein_HttpBodyPartDatasetUrl instance = createValidInstance();
        String exceptionMessage = 'No exception thrown for null values';

        Exception actualException = null;
        try {
            instance.setType(null);
        } catch (Einstein_StringIsEmptyException e) {
            actualException = e;
        }

        System.assertNotEquals(null, actualException, exceptionMessage);
        if (actualException != null) {
            System.assertEquals('type', actualException.getMessage(), 'The exception message should match the expected for null values');
        }
    }
}
