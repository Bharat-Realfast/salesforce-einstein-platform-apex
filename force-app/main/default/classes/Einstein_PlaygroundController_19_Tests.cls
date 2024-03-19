
@isTest
private class Einstein_PlaygroundController_19_Tests {
    
    @isTest
    static void testValidObjectWithSourceFields() {
        String objectName = 'Account';
        String sourceOrLabel = 'Source';

        String result = Einstein_PlaygroundController.getObjectFields(objectName, sourceOrLabel);

        System.assertNotEquals(null, result, 'Result should not be null.');
        List<Object> fieldData = (List<Object>)JSON.deserializeUntyped(result);
        System.assert(fieldData.size() > 0, 'Should have at least one source field.');
    }

    @isTest
    static void testValidObjectWithLabelFields() {
        String objectName = 'Account';
        String sourceOrLabel = 'Label';

        String result = Einstein_PlaygroundController.getObjectFields(objectName, sourceOrLabel);

        System.assertNotEquals(null, result, 'Result should not be null.');
        List<Object> fieldData = (List<Object>)JSON.deserializeUntyped(result);
        System.assert(fieldData.size() > 0, 'Should have at least one label field.');
    }

    @isTest
    static void testInvalidObjectName() {
        String objectName = 'InvalidObject';
        String sourceOrLabel = 'Source';

        String result = Einstein_PlaygroundController.getObjectFields(objectName, sourceOrLabel);

        System.assertEquals('[]', result, 'Result should be an empty list for non-existent object.');
    }

    @isTest
    static void testValidObjectNoMatchingFields() {
        String objectName = 'User';
        String sourceOrLabel = 'Label'; // Assuming User object has no label fields satisfying criteria

        String result = Einstein_PlaygroundController.getObjectFields(objectName, sourceOrLabel);

        System.assertEquals('[]', result, 'Result should be an empty list when no matching fields are found.');
    }
    
    @isTest
    static void testNullObjectName() {
        String objectName = null;
        String sourceOrLabel = 'Source';

        String result = Einstein_PlaygroundController.getObjectFields(objectName, sourceOrLabel);

        System.assertEquals('[]', result, 'Result should be an empty list for null objectName.');
    }

    @isTest
    static void testEmptySourceOrLabel() {
        String objectName = 'Account';
        String sourceOrLabel = '';

        String result = Einstein_PlaygroundController.getObjectFields(objectName, sourceOrLabel);

        System.assertEquals('[]', result, 'Result should be an empty list for empty sourceOrLabel.');
    }
}
