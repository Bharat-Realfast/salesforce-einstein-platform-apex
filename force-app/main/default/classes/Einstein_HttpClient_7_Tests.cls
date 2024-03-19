
@isTest
public class MyHttpCalloutMock implements HttpCalloutMock {
    // Mock response fields
    private Integer mockStatusCode;
    private String mockResponseBody;

    // Constructor
    public MyHttpCalloutMock(Integer statusCode, String responseBody) {
        this.mockStatusCode = statusCode;
        this.mockResponseBody = responseBody;
    }

    // Implementation of the HttpCalloutMock interface respond method
    public HTTPResponse respond(HTTPRequest request) {
        // Create a fake HTTP response
        HTTPResponse fakeResponse = new HTTPResponse();
        fakeResponse.setStatusCode(mockStatusCode);
        fakeResponse.setBody(mockResponseBody);
        // You can also set the response's status if needed
        // fakeResponse.setStatus('OK');
        return fakeResponse;
    }
}


@isTest
private class Einstein_HttpClient_7_Tests {

    @isTest
    static void testSuccessfulGetRequest() {
        // Arrange
        Einstein_PredictionService mockService = new Einstein_PredictionService();
        // You should set the base URL according to your mock service needs
        mockService.baseUrl = 'https://api.einstein.ai/v2/';
        Einstein_HttpClient client = new Einstein_HttpClient(mockService, 'vision/predict');

        // Set up the mock HTTP response
        String expectedResponseBody = '{"data": "mock response"}';
        MyHttpCalloutMock mock = new MyHttpCalloutMock(200, expectedResponseBody);
        Test.setMock(HttpCalloutMock.class, mock);

        // Act
        Test.startTest();
        client.execute();
        Test.stopTest();

        // Assert
        System.assertEquals(200, client.getStatusCode(), 'Status code should be 200.');
        System.assertEquals(expectedResponseBody, client.getResponseAsString(), 'Response body should match the expected mock response.');
    }
}
