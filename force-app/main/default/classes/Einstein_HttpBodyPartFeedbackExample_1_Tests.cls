
@isTest
private class EinsteinBodyPartFbExTests {
    
    @isTest
    static void testBuildBase64Type() {
        Einstein_HttpBodyPartFeedbackExample instance = new Einstein_HttpBodyPartFeedbackExample(
            'sampleName', 'positiveLabel', 'modelId123', 'base64Data', Einstein_HttpBodyPartFeedbackExample.Types.BASE64);

        Blob resultBlob = instance.build();

        System.assertNotEquals(null, resultBlob, 'Blob should not be null for BASE64 type');
        // Include a check to ensure the blob is not empty since encoding should result in some data
        System.assertNotEquals(Blob.valueOf(''), resultBlob, 'Blob should not be empty for BASE64 type');
    }

    @isTest
    static void testBuildDocumentType() {
        Einstein_HttpBodyPartFeedbackExample instance = new Einstein_HttpBodyPartFeedbackExample(
            'sampleName', 'positiveLabel', 'modelIdABC', 'documentData', Einstein_HttpBodyPartFeedbackExample.Types.DOCUMENT);

        Blob resultBlob = instance.build();

        System.assertNotEquals(null, resultBlob, 'Blob should not be null for DOCUMENT type');
        // Include a check to ensure the blob is not empty since encoding should result in some data
        System.assertNotEquals(Blob.valueOf(''), resultBlob, 'Blob should not be empty for DOCUMENT type');
    }

    @isTest
    static void testBuildEmptyName() {
        Einstein_HttpBodyPartFeedbackExample instance = new Einstein_HttpBodyPartFeedbackExample(
            '', 'positiveLabel', 'modelIdABC', 'base64Data', Einstein_HttpBodyPartFeedbackExample.Types.BASE64);

        Blob resultBlob = instance.build();

        System.assertNotEquals(null, resultBlob, 'Blob should not be null when name is empty');
        // Include a check to ensure the blob is not empty since encoding should result in some data
        System.assertNotEquals(Blob.valueOf(''), resultBlob, 'Blob should not be empty when name is empty');
    }
}
