
@isTest
public class Einstein_HttpBodyPartDatasetUrl_1_Tests {
    
    @isTest
    static void testBuildMethodHappyPath() {
        // Arrange
        String validUrl = 'http://example.com/dataset';
        String validType = 'text/csv';
        Einstein_HttpBodyPartDatasetUrl bodyPart = new Einstein_HttpBodyPartDatasetUrl(validUrl, validType);
        
        // Act
        Blob resultBlob = bodyPart.build();
        
        // Assert
        System.assertNotEquals(null, resultBlob, 'The result should be a non-null Blob.');

        // Decode the Blob to a string for assertion
        String resultString = resultBlob.toString();
        // Because we don't know the exact implementation of WriteBoundary and WriteBodyParameter methods,
        // we can only assert that the result string should not be empty.
        System.assertNotEquals('', resultString, 'The result string should not be empty.');
    }
}
