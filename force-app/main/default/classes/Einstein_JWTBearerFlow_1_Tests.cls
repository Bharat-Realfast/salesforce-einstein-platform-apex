
@isTest
private class Einstein_JWTBearerFlow_1_Tests {

    // Define a simple interface that Einstein_JWT should implement
    public interface IEinstein_JWT {
        String issue();
    }

    // Mock implementation of IEinstein_JWT
    private class MockEinstein_JWT implements IEinstein_JWT {
        public String issue() {
            // Mock the behavior of the `issue` method
            return 'mockedJWT';
        }
    }

    // Mock class to simulate HTTP callout
    private class MockHttpCallout implements HttpCalloutMock {
        private Integer statusCode;
        private String body;

        public MockHttpCallout(Integer statusCode, String body) {
            this.statusCode = statusCode;
            this.body = body;
        }

        public HTTPResponse respond(HTTPRequest request) {
            HttpResponse response = new HttpResponse();
            response.setStatusCode(this.statusCode);
            response.setBody(this.body);
            response.setStatus(this.statusCode == 200 ? 'OK' : 'Bad Request');
            return response;
        }
    }

    @isTest
    static void testGetAccessTokenHappyPath() {
        // Arrange
        String tokenEndpoint = 'https://example.com/oauth/token';
        IEinstein_JWT jwt = new MockEinstein_JWT(); // Use the mock implementation
        String expectedResponseBody = '{"access_token": "expectedAccessTokenValue"}';
        
        Test.setMock(HttpCalloutMock.class, new MockHttpCallout(200, expectedResponseBody));

        Test.startTest();
        // Act
        String accessToken = Einstein_JWTBearerFlow.getAccessToken(tokenEndpoint, jwt);
        Test.stopTest();

        // Assert
        System.assertNotEquals(null, accessToken, 'Access token should not be null.');
        System.assertEquals('expectedAccessTokenValue', accessToken, 'Access token should match the expected value.');
    }

    @isTest
    static void testGetAccessTokenNon200Response() {
        // Arrange
        String tokenEndpoint = 'https://example.com/oauth/token';
        IEinstein_JWT jwt = new MockEinstein_JWT(); // Use the mock implementation
        String expectedResponseBody = '{"error": "invalid_grant"}';

        Test.setMock(HttpCalloutMock.class, new MockHttpCallout(400, expectedResponseBody));

        Test.startTest();
        // Act
        String accessToken = Einstein_JWTBearerFlow.getAccessToken(tokenEndpoint, jwt);
        Test.stopTest();

        // Assert
        System.assertEquals(null, accessToken, 'Access token should be null on non-200 HTTP response.');
    }
}
