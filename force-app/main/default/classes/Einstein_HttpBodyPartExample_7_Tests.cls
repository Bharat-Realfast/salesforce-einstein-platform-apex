
@isTest
public class Einstein_HttpBodyPartExample_7_Tests {
    
    // Happy Path Scenario: data is a non-empty string
    @isTest
    static void testSetDataWithNonEmptyString() {
        Einstein_HttpBodyPartExample instance = new Einstein_HttpBodyPartExample('TestName', 1L, 'TestData');
        Test.startTest();
        instance.setData('NewData');
        Test.stopTest();
        
        String expectedData = 'NewData';
        String actualData = instance.getData();
        
        System.assertEquals(expectedData, actualData, 'The data should be set correctly for non-empty strings.');
    }

    // Sad Path Scenario: data is an empty string
    @isTest
    static void testSetDataWithEmptyString() {
        Einstein_HttpBodyPartExample instance = new Einstein_HttpBodyPartExample('TestName', 1L, 'TestData');
        
        Boolean didThrowException = false;

        try {
            Test.startTest();
            instance.setData('');
            Test.stopTest();
        } catch (Einstein_StringIsEmptyException e) {
            didThrowException = true;
            // Verify that the exception message is as expected
            String expectedMessage = 'data';
            System.assertEquals(expectedMessage, e.getMessage(), 'The exception message should match for empty data strings.');
        }
        
        // Verify that the exception was thrown
        System.assert(didThrowException, 'An Einstein_StringIsEmptyException should be thrown for empty data strings.');
    }
}
