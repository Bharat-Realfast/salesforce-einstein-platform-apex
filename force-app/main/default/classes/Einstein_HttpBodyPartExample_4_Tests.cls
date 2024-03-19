
@isTest
private class Einstein_HttpBodyPartExample_4_Tests {

    @testSetup
    static void setup() {
        // Setup is not necessarily required for testing getter methods as no DML operations are involved
    }

    @isTest
    static void testGetLabelIdWithValidValue() {
        // Happy Path Scenario
        Einstein_HttpBodyPartExample part = new Einstein_HttpBodyPartExample('SampleName', 1L, 'SampleData');
        Test.startTest();
        long result = part.getLabelId();
        Test.stopTest();
        
        // Assertions
        System.assertEquals(1L, result, 'getLabelId should return 1L when set with 1L.');
    }

    @isTest
    static void testGetLabelIdWithInvalidValue() {
        try {
            // Exceptional Scenario
            Einstein_HttpBodyPartExample part = new Einstein_HttpBodyPartExample('SampleName', -1L, 'SampleData');
            Test.startTest();
            long result = part.getLabelId(); // This line should not be reached due to exception
            Test.stopTest();
            System.assert(false, 'Expected an Einstein_NullPointerException to be thrown.'); // This line should not be reached due to exception
        } catch (Einstein_NullPointerException e) {
            // Assertions
            System.assertEquals('Labels cannot be null', e.getMessage(), 'A proper exception message should be set.');
        }
    }
}
