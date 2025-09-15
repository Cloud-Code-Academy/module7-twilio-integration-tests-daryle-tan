/**
 * TwilioRestApiTest - Test class for TwilioRestApi
 * @see TwilioRestApi
 * 
 * TODO: Implement test methods to verify the functionality of the TwilioRestApi class
 */
@IsTest
private class TwilioRestApiTest {
    
    /**
     * Test handleIncomingSMS method with standard SMS parameters
     * 
     * TODO: Implement this test method to verify handling of standard SMS webhooks
     */
    @IsTest
    static void testHandleIncomingSMSStandard() {
        // TODO: Setup mock REST request with standard SMS parameters
        // - Create RestRequest and RestResponse objects
        // - Set requestURI (e.g., '/services/apexrest/twilio/sms')
        // - Set httpMethod to 'POST'
        // - Add required parameters (MessageSid, AccountSid, From, To, Body, etc.)
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/twilio/sms';
        req.httpMethod = 'POST';
        req.params.put('MessageSid', 'SM1234567890abcdef');
        req.params.put('AccountSid', 'AC1234567890abcdef');
        req.params.put('From', '+1234567890');
        req.params.put('To', '+0987654321');
        req.params.put('Body', 'Hello World!');
        // TODO: Set the mock request/response objects in RestContext
        RestContext.request = req;
        RestContext.response = new RestResponse();
        
        // TODO: Execute the test
        // TODO: Execute the test
        // - Call TwilioRestApi.handleIncomingSMS()
        String xml = TwilioRestApi.handleIncomingSMS();
        // TODO: Verify results
        // - Verify response XML is not null
        // - Verify response contains expected TwiML elements
        System.assertNotEquals(null, xml, 'Response XML should not be null');
        System.assert(xml.contains('<Response>'), 'Response should contain <Response>');
        System.assert(xml.contains('</Response>'), 'Response should contain closing tag');
    }
    
    /**
     * Test handleIncomingSMS method with media attachments
     * 
     * TODO: Implement this test method to verify handling of SMS with media
     */
    @IsTest
    static void testHandleIncomingSMSWithMedia() {
        // TODO: Setup mock REST request with media parameters
        // - Create RestRequest and RestResponse objects
        // - Set requestURI and httpMethod
        // - Add required parameters
        // - Add media attachment parameters (NumMedia, MediaUrl0, MediaContentType0, etc.)
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/twilio/sms';
        req.httpMethod = 'POST';
        req.params.put('MessageSid', 'SM1234567890abcdef');
        req.params.put('AccountSid', 'AC1234567890abcdef');
        req.params.put('From', '+1234567890');
        req.params.put('To', '+0987654321');
        req.params.put('Body', 'This is an image');
        req.params.put('NumMedia', '1');
        req.params.put('MediaUrl0', 'https://demo.twilio.com/owl.png');
        req.params.put('MediaContentType0', 'image/png');
        // TODO: Set the mock request/response objects in RestContext
        RestContext.request = req;
        RestContext.response = new RestResponse();
        // TODO: Execute the test
        // - Call TwilioRestApi.handleIncomingSMS()
        String xml = TwilioRestApi.handleIncomingSMS();
        // TODO: Verify results
        // - Verify response XML is not null
        // - Verify response contains expected TwiML elements
        System.assertNotEquals(null, xml, 'Response XML should not be null');
        System.assert(xml.contains('<Response>'), 'Response should contain <Response>');
        System.assert(xml.contains('</Response>'), 'Response should contain closing tag');
    }
    
    /**
     * Test handleIncomingSMS method with location data
     * 
     * TODO: Implement this test method to verify handling of SMS with location data
     */
    @IsTest
    static void testHandleIncomingSMSWithLocation() {
        // TODO: Setup mock REST request with location parameters
        // - Create RestRequest and RestResponse objects
        // - Set requestURI and httpMethod
        // - Add required parameters
        // - Add location parameters (FromCity, FromState, FromZip, FromCountry, etc.)
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/twilio/sms';
        req.httpMethod = 'POST';
        req.params.put('MessageSid', 'SM1234567890abcdef');
        req.params.put('AccountSid', 'AC1234567890abcdef');
        req.params.put('From', '+1234567890');
        req.params.put('To', '+0987654321');
        req.params.put('Body', 'My location');
        req.params.put('FromCity', 'San Antonio');
        req.params.put('FromState', 'TX');
        req.params.put('FromZip', '78209');
        req.params.put('FromCountry', 'US');
        // TODO: Set the mock request/response objects in RestContext
        RestContext.request = req;
        RestContext.response = new RestResponse();
        // TODO: Execute the test
        // - Call TwilioRestApi.handleIncomingSMS()
        String xml = TwilioRestApi.handleIncomingSMS();
        // TODO: Verify results
        // - Verify response XML is not null
        // - Verify response contains expected TwiML elements
        System.assertNotEquals(null, xml, 'Response XML should not be null');
        System.assert(xml.contains('<Response>'), 'Response should contain <Response>');
        System.assert(xml.contains('</Response>'), 'Response should contain closing tag');
    }
    
    /**
     * Test handleIncomingSMS method with WhatsApp parameters
     * 
     * TODO: Implement this test method to verify handling of WhatsApp messages
     */
    @IsTest
    static void testHandleIncomingSMSWithWhatsApp() {
        // TODO: Setup mock REST request with WhatsApp parameters
        // - Create RestRequest and RestResponse objects
        // - Set requestURI and httpMethod
        // - Add required parameters with WhatsApp format (e.g., From: 'whatsapp:+15551234567')
        // - Add WhatsApp specific parameters (ProfileName, WaId, etc.)
        // - Add WhatsApp location data if applicable
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/twilio/sms';
        req.httpMethod = 'POST';
        req.params.put('MessageSid', 'SM1234567890abcdef');
        req.params.put('AccountSid', 'AC1234567890abcdef');
        req.params.put('From', 'whatsapp:+15551234567');
        req.params.put('To', 'whatsapp:+15557654321');
        req.params.put('Body', 'Hello from WhatsApp');
        req.params.put('ProfileName', 'Test User');
        req.params.put('WaId', '15551234567');
        req.params.put('FromCity', 'New York');
        req.params.put('FromState', 'NY');
        req.params.put('FromCountry', 'US');
        // TODO: Set the mock request/response objects in RestContext
        RestContext.request = req;
        RestContext.response = new RestResponse();
        // TODO: Execute the test
        // - Call TwilioRestApi.handleIncomingSMS()
         String xml = TwilioRestApi.handleIncomingSMS();
        // TODO: Verify results
        // - Verify response XML is not null
        // - Verify response contains expected TwiML elements
        System.assertNotEquals(null, xml, 'Response XML should not be null');
        System.assert(xml.contains('<Response>'), 'Response should contain <Response>');
        System.assert(xml.contains('</Response>'), 'Response should contain closing tag');
    }
} 