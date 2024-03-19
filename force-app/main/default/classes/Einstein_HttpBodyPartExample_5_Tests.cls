
@isTest
private class Einstein_HttpBodyPartExample_5_Tests {

    // Helper method to create an instance of the class for testing
    private static Einstein_HttpBodyPartExample createBodyPartExampleInstance(long labelId) {
        return new Einstein_HttpBodyPartExample('TestName', labelId, 'TestData');
    }

    @isTest
    static void testSetLabelIdValidValue() {
        Test.startTest();

        Einstein_HttpBodyPartExample bodyPartExample = createBodyPartExampleInstance(10);
        long expectedLabelId = 10;

        Test.stopTest();

        // Assert that the getLabelId method returns the value that was set
        System.assertEquals(expectedLabelId, bodyPartExample.getLabelId(), 'The labelId should be set correctly to the passed value.');
    }

    @isTest
    static void testSetLabelIdInvalidValue() {
        Boolean didThrowException = false;
        
        Test.startTest();
        
        try {
            createBodyPartExampleInstance(0);
        } catch (Einstein_NullPointerException e) {
            didThrowException = true;
        }

        Test.stopTest();

        // Assert that an exception was thrown for an invalid labelId value
        System.assertEquals(true, didThrowException, 'An exception should have been thrown for a labelId less than 1.');
    }
}
