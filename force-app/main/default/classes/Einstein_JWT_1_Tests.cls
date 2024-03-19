
@isTest
public class Einstein_JWT_1_Tests {

    // Utility method to create a basic Einstein_JWT object with required fields
    private static Einstein_JWT createBasicJWT(String alg) {
        Einstein_JWT jwt = new Einstein_JWT(alg);
        jwt.iss = 'issuer';
        jwt.sub = 'subject';
        jwt.aud = 'audience';
        // Set other required properties here if needed
        return jwt;
    }

    @isTest
    static void testIssueWithHS256() {
        Einstein_JWT jwt = createBasicJWT(Einstein_JWT.HS256);
        jwt.privateKey = 'privateKey'; // Assuming a base64 encoded key
        String token = jwt.issue();

        // Assert that JWT is not null or empty
        System.assertNotEquals(null, token, 'Token should not be null');
        // Assert that JWT has 3 parts separated by '.'
        Integer partsCount = token.split('\\.').size();
        System.assertEquals(3, partsCount, 'Token should have 3 parts');
    }

    @isTest
    static void testIssueWithRS256Cert() {
        Einstein_JWT jwt = createBasicJWT(Einstein_JWT.RS256);
        jwt.cert = 'cert'; // Assuming a certificate is provided
        String token = jwt.issue();

        System.assertNotEquals(null, token, 'Token should not be null');
        Integer partsCount = token.split('\\.').size();
        System.assertEquals(3, partsCount, 'Token should have 3 parts');
    }

    @isTest
    static void testIssueWithRS256PrivateKey() {
        Einstein_JWT jwt = createBasicJWT(Einstein_JWT.RS256);
        jwt.pkcs8 = 'pkcs8'; // Assuming a base64 encoded private key
        String token = jwt.issue();

        System.assertNotEquals(null, token, 'Token should not be null');
        Integer partsCount = token.split('\\.').size();
        System.assertEquals(3, partsCount, 'Token should have 3 parts');
    }

    @isTest
    static void testIssueWithNoneAlg() {
        Einstein_JWT jwt = createBasicJWT(Einstein_JWT.NONE);
        String token = jwt.issue();

        System.assertNotEquals(null, token, 'Token should not be null');
        Integer partsCount = token.split('\\.').size();
        System.assertEquals(2, partsCount, 'Token should have 2 parts when alg is NONE');
    }

    @isTest
    static void testIssueWithMissingFields() {
        Einstein_JWT jwt = new Einstein_JWT(Einstein_JWT.HS256);
        // Deliberately not setting iss, sub, aud to simulate missing fields
        
        Boolean didThrowException = false;
        try {
            String token = jwt.issue();
        } catch (NullPointerException e) {
            // Expected exception due to missing fields
            didThrowException = true;
        }
        System.assert(didThrowException, 'A NullPointerException should have been thrown due to missing fields.');
    }
}
