
@isTest
public class EinsteinHttpBPartFbExTest {

    // Test to ensure the getModelId method returns the correct modelId
    @isTest
    static void testGetModelId() {
        // Creating an instance of the class with a known modelId
        Einstein_HttpBodyPartFeedbackExample exampleInstance = new Einstein_HttpBodyPartFeedbackExample(
            'TestName', // name
            'TestLabel', // expectedLabel
            'Model123', // modelId
            'TestData', // data
            Einstein_HttpBodyPartFeedbackExample.Types.BASE64 // type
        );

        // Expected modelId to be returned from the getModelId method
        String expectedModelId = 'Model123';
        
        // Wrapping the test code within Test.startTest() and Test.stopTest() to simulate a test execution context
        Test.startTest();
        String actualModelId = exampleInstance.getModelId(); // Calling the method being tested
        Test.stopTest();

        // Asserting that the modelId returned matches the expected value
        System.assertEquals(expectedModelId, actualModelId, 'The modelId returned should match the expected value.');
    }
}
