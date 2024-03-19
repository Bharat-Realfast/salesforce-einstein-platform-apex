
@isTest
private class Einstein_HttpBodyPartExample_6_Tests {
    
    @testSetup
    static void setup() {
        // Typically, we would create test data here, but since the class we are testing does not interact with SObjects directly, no test data is required.
    }

    @isTest
    static void testGetData_HappyPath() {
        // Given
        String expectedData = 'Test data content';
        Einstein_HttpBodyPartExample bodyPart = new Einstein_HttpBodyPartExample('SampleName', 123, expectedData);

        // When
        String actualData = bodyPart.getData();

        // Then
        System.assertEquals(expectedData, actualData, 'The data should match the value set in the constructor.');
    }
}
