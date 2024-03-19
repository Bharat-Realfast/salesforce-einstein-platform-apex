
@isTest
private class Einstein_PlaygroundController_17_Tests {

    static Einstein_Settings__c settings;
    static ContentVersion contentVersion;

    @testSetup
    static void setup() {
        // Create Einstein_Settings__c record with email
        settings = new Einstein_Settings__c(Einstein_EMail__c = 'test@example.com');
        insert settings;
        
        // Create ContentVersion record representing the Einstein certificate
        contentVersion = new ContentVersion(
            Title = 'einstein_platform_setup',
            PathOnClient = 'einstein_platform.pem',
            VersionData = Blob.valueOf('Test content'),
            IsLatest = true
        );
        insert contentVersion;
    }

    static Einstein_Settings__c createSettings(Boolean emailExists) {
        Einstein_Settings__c newSettings = new Einstein_Settings__c();
        if (emailExists) {
            newSettings.Einstein_EMail__c = 'test@example.com';
        }
        upsert newSettings;
        return newSettings;
    }

    static void insertContentVersion(Boolean certExists) {
        if (certExists) {
            contentVersion.Title = 'einstein_platform';
            upsert contentVersion;
        } else {
            contentVersion.Title = 'nonexistent_platform';
            upsert contentVersion;
        }
    }

    @isTest
    static void testValidateSetupBothExist() {
        createSettings(true);
        insertContentVersion(true);

        Test.startTest();
        Map<String, Boolean> result = Einstein_PlaygroundController.validateEinsteinPlatformSetup();
        Test.stopTest();
        
        System.assertEquals(true, result.get('einsteinEmail'), 'Einstein Email should be true');
        System.assertEquals(true, result.get('einsteinCert'), 'Einstein Certificate should be true');
    }

    @isTest
    static void testValidateSetupNoCert() {
        createSettings(true);
        insertContentVersion(false);

        Test.startTest();
        Map<String, Boolean> result = Einstein_PlaygroundController.validateEinsteinPlatformSetup();
        Test.stopTest();
        
        System.assertEquals(true, result.get('einsteinEmail'), 'Einstein Email should be true');
        System.assertEquals(false, result.get('einsteinCert'), 'Einstein Certificate should be false');
    }

    @isTest
    static void testValidateSetupNoEmail() {
        createSettings(false);
        insertContentVersion(true);

        Test.startTest();
        Map<String, Boolean> result = Einstein_PlaygroundController.validateEinsteinPlatformSetup();
        Test.stopTest();
        
        System.assertEquals(false, result.get('einsteinEmail'), 'Einstein Email should be false');
        System.assertEquals(true, result.get('einsteinCert'), 'Einstein Certificate should be true');
    }

    @isTest
    static void testValidateSetupNeitherExist() {
        createSettings(false);
        insertContentVersion(false);

        Test.startTest();
        Map<String, Boolean> result = Einstein_PlaygroundController.validateEinsteinPlatformSetup();
        Test.stopTest();
        
        System.assertEquals(false, result.get('einsteinEmail'), 'Einstein Email should be false');
        System.assertEquals(false, result.get('einsteinCert'), 'Einstein Certificate should be false');
    }
}
