
@isTest
private class Einstein_HttpBodyPartFbEx2_Tests {

    @isTest
    static void testGetNameHappyPath() {
        // Setup test data
        String expectedName = 'TestName';
        Einstein_HttpBodyPartFeedbackExample instance = new Einstein_HttpBodyPartFeedbackExample(
            expectedName,
            'ExpectedLabel',
            'ModelId',
            'Data',
            Einstein_HttpBodyPartFeedbackExample.Types.BASE64
        );

        // Execute the test
        String actualName = instance.getName();

        // Verify the results
        System.assertEquals(expectedName, actualName, 'The name should match the one provided in the constructor.');
    }

    @isTest
    static void testGetNameWhenNull() {
        // Setup test data
        String expectedName = null;
        Einstein_HttpBodyPartFeedbackExample instance = new Einstein_HttpBodyPartFeedbackExample(
            expectedName,
            'ExpectedLabel',
            'ModelId',
            'Data',
            Einstein_HttpBodyPartFeedbackExample.Types.BASE64
        );

        // Execute the test
        String actualName = instance.getName();

        // Verify the results
        System.assertEquals(expectedName, actualName, 'The name should be null as it was set to null.');
    }
}
