/**
 * TwilioServiceTest - Test class for TwilioService
 * @see TwilioService
 * 
 * TODO: Implement test methods to verify the functionality of the TwilioService class
 */
@IsTest
private class TwilioServiceTest {
    
    /**
     * Test the sendSMS method with a valid request
     * 
     * TODO: Implement this test method to verify that sending an SMS works correctly.
     */
    @IsTest
    static void testSendSMS() {
        // TODO: Setup test data
        // - Create test phone number and message body
        String toNumber = '+1234567890';
        String messageBody = 'Hello, World!';
        // TODO: Setup mock callout response
        // - Use TwilioCalloutMock to simulate a successful response
        String mockResponse = '{ "sid": "SM1234567890abcdef", "status": "sent" }';
        TwilioCalloutMock mock = new TwilioCalloutMock(201, mockResponse);
        Test.setMock(HttpCalloutMock.class, mock);
        // TODO: Execute the test
        // - Call TwilioService.sendSMS() method
        TwilioResponse response = TwilioService.sendSMS(toNumber, messageBody);
        // TODO: Verify results
        // - Verify that response is successful
        // - Verify status code is correct
        // - Verify response body contains expected values (sid, status, etc.)
        System.assert(response.success, 'Response should be successful');
        System.assertEquals(201, response.statusCode, 'Status code should be 201');
        System.assert(response.body.contains('sid'), 'Response body should contain sid');
        System.assert(response.body.contains('sent'), 'Response body should contain status');
    }
    
    /**
     * Test the sendSMS method with an error response
     * 
     * TODO: Implement this test method to verify error handling in sendSMS
     */
    @IsTest
    static void testSendSMSError() {
        // TODO: Setup test data
        // - Create test phone number and message body
        String toNumber = '+1234567890';
        String messageBody = 'Hello from test!';
        // TODO: Setup mock callout response
        // - Use TwilioCalloutMock to simulate an error response
        String mockError = '{"error":"Invalid number"}';
        TwilioCalloutMock mock = new TwilioCalloutMock(400, mockError);
        Test.setMock(HttpCalloutMock.class, mock);
        // TODO: Execute the test
        // - Call TwilioService.sendSMS() method
        TwilioResponse response = TwilioService.sendSMS(toNumber, messageBody);
        // TODO: Verify results
        // - Verify that response is not successful
        // - Verify error status code is correct
        // - Verify error message is extracted correctly
        System.assert(!response.success, 'Response should not be successful');
        System.assertEquals(400, response.statusCode, 'Status code should be 400');
        System.assert(response.body.contains('Invalid number'), 'Error message should be present');
    }
    
    /**
     * Test the getMessages method
     * 
     * TODO: Implement this test method to verify the getMessages functionality
     */
    @IsTest
    static void testGetMessages() {
        // TODO: Setup mock callout response
        // - Use TwilioCalloutMock to simulate a successful response with message list
        String mockResponse = '{"messages":[{"sid":"SM1"},{"sid":"SM2"}]}';
        TwilioCalloutMock mock = new TwilioCalloutMock(200, mockResponse);
        Test.setMock(HttpCalloutMock.class, mock);
        // TODO: Execute the test
        // - Call TwilioService.getMessages() method with an appropriate limit
        TwilioResponse response = TwilioService.getMessages(2);
        // TODO: Verify results
        // - Verify that response is successful
        // - Verify status code is correct
        // - Verify response body contains expected messages data
        System.assert(response.success, 'Response should be successful');
        System.assertEquals(200, response.statusCode, 'Status code should be 200');
        System.assert(response.body.contains('messages'), 'Response body should contain messages');
        System.assert(response.body.contains('SM1'), 'Response should contain message sid SM1');
        System.assert(response.body.contains('SM2'), 'Response should contain message sid SM2');
    }
    
    /**
     * Test the getMessages method with null/invalid limit
     * 
     * TODO: Implement this test method to verify handling of edge cases
     */
    @IsTest
    static void testGetMessagesWithInvalidLimit() {
        // TODO: Setup mock callout response
        // - Use TwilioCalloutMock to simulate a successful response
        String mockResponse = '{"messages":[{"sid":"SM1"}]}';
        TwilioCalloutMock mock = new TwilioCalloutMock(200, mockResponse);
        Test.setMock(HttpCalloutMock.class, mock);
        // TODO: Execute the test with null limit
        // - Call TwilioService.getMessages() method with null
        TwilioResponse responseNull = TwilioService.getMessages(null);
        // TODO: Execute the test with negative limit
        // - Call TwilioService.getMessages() method with a negative number
         TwilioResponse responseNegative = TwilioService.getMessages(-5);
        // TODO: Verify results
        // - Verify that both responses are successful
        // - Verify that the service handles these edge cases correctly
        System.assert(responseNull.success, 'Response with null limit should be successful');
        System.assertEquals(200, responseNull.statusCode, 'Status code should be 200');
        System.assert(responseNegative.success, 'Response with negative limit should be successful');
        System.assertEquals(200, responseNegative.statusCode, 'Status code should be 200');
    }
    
    /**
     * Test exception handling in makeHttpRequest
     * 
     * TODO: Implement this test method to verify exception handling
     */
    @IsTest
    static void testMakeHttpRequestException() {
        // TODO: Setup mock that throws exception
        // - Use TwilioCalloutMock.createExceptionMock()
        TwilioCalloutMock mock = TwilioCalloutMock.createExceptionMock();
        Test.setMock(HttpCalloutMock.class, mock);
        // TODO: Execute the test
        // - Call a TwilioService method that will use the mock
        TwilioResponse response = TwilioService.sendSMS('+1234567890', 'Test');
        // TODO: Verify results
        // - Verify that response indicates failure
        // - Verify that status code is set to 500 (or appropriate error code)
        // - Verify that error message is set correctly
        System.assert(!response.success, 'Response should indicate failure');
        System.assertEquals(500, response.statusCode, 'Status code should be 500');
        System.assert(response.body.contains('Mock callout exception'), 'Error message should be set correctly');
    }
} 