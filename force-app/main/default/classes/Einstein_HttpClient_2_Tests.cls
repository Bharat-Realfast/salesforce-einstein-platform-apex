
@isTest
private class Einstein_HttpClient_2_Tests {

    // Test method for setting isDelete to true
    @isTest
    static void shouldSetIsDeleteToTrue() {
        // Arrange
        Einstein_HttpClient client = (Einstein_HttpClient)JSON.deserialize('{"url":"http://example.com"}', Einstein_HttpClient.class);

        // Act
        client.isDelete(true);

        // Assert
        System.assertEquals(true, client.isDelete(), 'The isDelete should be set to true');
    }

    // Test method for setting isDelete to false
    @isTest
    static void shouldSetIsDeleteToFalse() {
        // Arrange
        Einstein_HttpClient client = (Einstein_HttpClient)JSON.deserialize('{"url":"http://example.com"}', Einstein_HttpClient.class);

        // Act
        client.isDelete(false);

        // Assert
        System.assertEquals(false, client.isDelete(), 'The isDelete should be set to false');
    }
}
