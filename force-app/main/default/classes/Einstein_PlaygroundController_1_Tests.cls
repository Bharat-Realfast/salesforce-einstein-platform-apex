
@isTest
private class Einstein_PlaygroundController_1_Tests {
    
    @isTest
    static void testGetMyUserIdHappyPath() {
        // Execute the method to test
        Id userId = Einstein_PlaygroundController.getMyUserId();
        
        // Assert that the returned ID is equal to the context user ID
        System.assertEquals(UserInfo.getUserId(), userId, 'The user ID should match the current user ID.');
    }
}
