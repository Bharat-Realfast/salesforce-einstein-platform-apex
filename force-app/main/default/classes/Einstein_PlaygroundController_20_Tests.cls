
@isTest
private class Einstein_PlaygroundController_20_Tests {

    @testSetup
    static void setupTestData() {
        // Create ContentVersion used for testing
        ContentVersion contentVersion = new ContentVersion(
            Title = 'Test',
            PathOnClient = 'test.jpg',
            VersionData = Blob.valueOf('Test Content'),
            IsMajorVersion = true
        );
        insert contentVersion;
    }

    @isTest
    static void testWriteCDWithValidData() {
        Test.startTest();
        
        // Retrieve test data
        Id contentDocumentId = [SELECT ContentDocumentId FROM ContentVersion LIMIT 1].ContentDocumentId;
        
        // Execute target method
        ContentDistribution result = Einstein_PlaygroundController.writeCD(contentDocumentId, 'TestDistribution');
        Test.stopTest();

        ContentDistribution cdResult;
        try {
            // Re-query the ContentDistribution record to get the latest values from the database
            cdResult = [SELECT Id, Name, ContentDownloadUrl FROM ContentDistribution WHERE Id = :result.Id];
        } catch (QueryException e) {
            // If the record wasn't found, fail the test
            System.assert(false, 'The ContentDistribution record was not found after execution of writeCD.');
        }

        // Assertions
        System.assertNotEquals(null, cdResult, 'ContentDistribution should not be null');
        System.assert(cdResult.Name.startsWith('EinsteinTemp'), 'The name of ContentDistribution should start with the prefix');
        System.assertNotEquals(null, cdResult.ContentDownloadUrl, 'ContentDownloadUrl should not be null');
    }

    @isTest
    static void testWriteCDWithInvalidContentDocumentId() {
        Test.startTest();
        
        // Generate a random ID that will not be found in the ContentVersion
        Id fakeContentDocumentId = Id.valueOf('069000000000000AAA');
        
        // Assert exception is thrown
        Boolean didThrowException = false;
        try {
            Einstein_PlaygroundController.writeCD(fakeContentDocumentId, 'TestDistribution');
        } catch (QueryException e) {
            didThrowException = true;
        }
        System.assert(didThrowException, 'A QueryException should have been thrown due to invalid ContentDocumentId');
        
        Test.stopTest();
    }
}
