
@isTest
private class Einstein_HttpBodyPartPrediction_1_Tests {

    private static String validModelId = 'Model123';
    private static String validData = 'TestData';
    private static String validSampleId = 'Sample123';
    private static Integer validNumResults = 5;

    private static String getDecodedBody(Blob body) {
        // Decode the base64-encoded Blob back to string for assertion checks
        String bodyString = body.toString();
        // Assuming that the build method encodes string properly
        return bodyString;
    }

    @isTest
    static void testBuildWithBase64TypeHappyPath() {
        Einstein_HttpBodyPartPrediction testPart = new Einstein_HttpBodyPartPrediction(validModelId, validData, validNumResults, validSampleId, Einstein_HttpBodyPartPrediction.Types.BASE64);
        Blob resultBlob = testPart.build();
        String resultString = getDecodedBody(resultBlob);
        System.assert(resultString.contains('modelId'), 'The modelId should be in the body');
        System.assert(resultString.contains('sampleBase64Content'), 'The sampleBase64Content should be in the body');
    }

    @isTest
    static void testBuildWithURLTypeHappyPath() {
        Einstein_HttpBodyPartPrediction testPart = new Einstein_HttpBodyPartPrediction(validModelId, validData, validNumResults, validSampleId, Einstein_HttpBodyPartPrediction.Types.URL);
        Blob resultBlob = testPart.build();
        String resultString = getDecodedBody(resultBlob);
        System.assert(resultString.contains('modelId'), 'The modelId should be in the body');
        System.assert(resultString.contains('sampleLocation'), 'The sampleLocation should be in the body');
    }

    @isTest
    static void testBuildWithDocumentTypeHappyPath() {
        Einstein_HttpBodyPartPrediction testPart = new Einstein_HttpBodyPartPrediction(validModelId, validData, validNumResults, validSampleId, Einstein_HttpBodyPartPrediction.Types.DOCUMENT);
        Blob resultBlob = testPart.build();
        String resultString = getDecodedBody(resultBlob);
        System.assert(resultString.contains('modelId'), 'The modelId should be in the body');
        System.assert(resultString.contains('document'), 'The document should be in the body');
    }

    @isTest
    static void testBuildWithMissingModelIdSadPath() {
        Einstein_HttpBodyPartPrediction testPart = new Einstein_HttpBodyPartPrediction(null, validData, validNumResults, validSampleId, Einstein_HttpBodyPartPrediction.Types.BASE64);
        Blob resultBlob = testPart.build();
        String resultString = getDecodedBody(resultBlob);
        System.assert(!resultString.contains('modelId'), 'The modelId should not be in the body when it is null');
    }

    @isTest
    static void testBuildWithInvalidNumResultsSadPath() {
        Einstein_HttpBodyPartPrediction testPart = new Einstein_HttpBodyPartPrediction(validModelId, validData, -1, validSampleId, Einstein_HttpBodyPartPrediction.Types.BASE64);
        Blob resultBlob = testPart.build();
        String resultString = getDecodedBody(resultBlob);
        System.assert(!resultString.contains('numResults'), 'The numResults should not be in the body for invalid values');
    }
}
