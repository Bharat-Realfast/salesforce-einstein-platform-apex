
@isTest
private class EinsteinHttpBodyFeedbackTests {

    @isTest
    static void testSetExpectedLabelWithValidString() {
        String validExpectedLabel = 'ValidLabel';
        Einstein_HttpBodyPartFeedbackExample example = new Einstein_HttpBodyPartFeedbackExample(
            'TestName', validExpectedLabel, 'TestModelId', 'TestData', Einstein_HttpBodyPartFeedbackExample.Types.BASE64
        );
        
        Test.startTest();
        example.setExpectedLabel(validExpectedLabel);
        Test.stopTest();

        System.assertEquals(validExpectedLabel, example.getExpectedLabel(), 'The expected label should match the input string.');
    }

    @isTest
    static void testSetExpectedLabelWithEmptyString() {
        String emptyExpectedLabel = '';
        Einstein_HttpBodyPartFeedbackExample example = new Einstein_HttpBodyPartFeedbackExample(
            'TestName', 'ValidLabel', 'TestModelId', 'TestData', Einstein_HttpBodyPartFeedbackExample.Types.BASE64
        );
        
        Boolean exceptionThrown = false;

        try {
            example.setExpectedLabel(emptyExpectedLabel);
        } catch (Einstein_StringIsEmptyException e) {
            exceptionThrown = true;
        }

        System.assert(exceptionThrown, 'An Einstein_StringIsEmptyException should be thrown when the expected label is empty.');
    }
}
