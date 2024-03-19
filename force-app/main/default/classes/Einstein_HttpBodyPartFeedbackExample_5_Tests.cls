
@isTest
public class Einstein_HttpBodyPartFBExample_Tests {

    @testSetup
    static void setup() {
        // Test setup logic if required. For this scenario, no setup data is required.
    }

    @isTest
    static void testSetDataWithNonEmptyString() {
        Einstein_HttpBodyPartFeedbackExample instance = new Einstein_HttpBodyPartFeedbackExample(
            'TestName', 'TestLabel', 'TestModelId', 'TestData', Einstein_HttpBodyPartFeedbackExample.Types.BASE64);
        
        Test.startTest();
        instance.setData('ValidData');
        Test.stopTest();
        
        System.assertEquals('ValidData', instance.getData(), 'The data should be set to the non-empty string provided.');
    }

    @isTest(expectedExceptions = Einstein_StringIsEmptyException.class)
    static void testSetDataWithEmptyString() {
        Einstein_HttpBodyPartFeedbackExample instance = new Einstein_HttpBodyPartFeedbackExample(
            'TestName', 'TestLabel', 'TestModelId', 'TestData', Einstein_HttpBodyPartFeedbackExample.Types.BASE64);

        Test.startTest();
        instance.setData('');
        Test.stopTest();
    }

    @isTest(expectedExceptions = Einstein_StringIsEmptyException.class)
    static void testSetDataWithNull() {
        Einstein_HttpBodyPartFeedbackExample instance = new Einstein_HttpBodyPartFeedbackExample(
            'TestName', 'TestLabel', 'TestModelId', 'TestData', Einstein_HttpBodyPartFeedbackExample.Types.BASE64);

        Test.startTest();
        instance.setData(null);
        Test.stopTest();
    }
}
