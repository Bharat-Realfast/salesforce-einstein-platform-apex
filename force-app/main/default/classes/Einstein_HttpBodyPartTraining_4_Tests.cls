
@isTest
public class Einstein_HttpBodyPartTraining_4_Tests {

    // Since getName() doesn't depend on any Salesforce data setup, we do not need a @testSetup method.
    
    // Test to ensure getName() returns the correct name
    @isTest
    static void testGetNameReturnsCorrectValue() {
        // Given
        String expectedName = 'Valid Name';
        Einstein_HttpBodyPartTraining bodyPart = new Einstein_HttpBodyPartTraining(1L, expectedName, 10, 0.0002, null);

        // When
        String actualName = bodyPart.getName();

        // Then
        System.assertEquals(expectedName, actualName, 'The name should match the one that was set.');
    }

    // Test to ensure setName() throws exception when name is empty
    @isTest
    static void testSetNameEmptyValueThrowsException() {
        // Given
        String invalidName = '';
        
        // When/Then
        Boolean didThrowException = false;
        try {
            Einstein_HttpBodyPartTraining bodyPart = new Einstein_HttpBodyPartTraining(1L, invalidName, 10, 0.0002, null);
        } catch (Einstein_StringIsEmptyException ex) {
            didThrowException = true;
        }

        // Then
        System.assert(didThrowException, 'An exception should be thrown when trying to set an empty name.');
    }

    // Test to ensure setName() throws exception when name is too long
    @isTest
    static void testSetNameTooLongValueThrowsException() {
        // Given
        String invalidName = 'a'.repeat(181); // Creates a string with 181 'a' characters
        
        // When/Then
        Boolean didThrowException = false;
        try {
            Einstein_HttpBodyPartTraining bodyPart = new Einstein_HttpBodyPartTraining(1L, invalidName, 10, 0.0002, null);
        } catch (Einstein_StringTooLongException ex) {
            didThrowException = true;
        }

        // Then
        System.assert(didThrowException, 'An exception should be thrown when trying to set a name that is too long.');
    }
}
