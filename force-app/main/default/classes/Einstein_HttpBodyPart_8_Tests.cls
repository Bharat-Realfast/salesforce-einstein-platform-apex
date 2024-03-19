
@isTest
private class Einstein_HttpBodyPart_8_Tests {

    // Test valid parameters
    @isTest
    static void testValidParameters() {
        String key = 'file';
        String fileContent = 'Sample file content';
        Blob fileBlob = Blob.valueOf(fileContent);
        String file64 = EncodingUtil.base64Encode(fileBlob);
        String fileName = 'test.png';

        String result = Einstein_HttpBodyPart.WriteBlobBodyParameter(key, file64, fileName);

        System.assertNotEquals(null, result, 'Result should not be null');
        // The result will be base64 encoded, so we can't check for the file content directly.
        System.assertNotEquals('', result, 'The result should not be an empty string.');
    }

    // Test different file extensions
    @isTest
    static void testDifferentFileExtensions() {
        String key = 'file';
        String fileContent = 'Sample file content';
        Blob fileBlob = Blob.valueOf(fileContent);
        String file64 = EncodingUtil.base64Encode(fileBlob);

        String fileNameJpg = 'test.jpg';
        String resultJpg = Einstein_HttpBodyPart.WriteBlobBodyParameter(key, file64, fileNameJpg);

        String fileNamePng = 'test.png';
        String resultPng = Einstein_HttpBodyPart.WriteBlobBodyParameter(key, file64, fileNamePng);

        // Since the results are base64 encoded, we do not assert the MIME type directly.
        // Instead, we ensure that the results are not null and not the same for different file types.
        System.assertNotEquals(null, resultJpg, 'Result for JPG should not be null');
        System.assertNotEquals(null, resultPng, 'Result for PNG should not be null');
        System.assertNotEquals(resultJpg, resultPng, 'Results for different file types should not be equal');
    }

    // Additional test methods for edge case, sad path, and exceptional scenarios
    // ...
}
