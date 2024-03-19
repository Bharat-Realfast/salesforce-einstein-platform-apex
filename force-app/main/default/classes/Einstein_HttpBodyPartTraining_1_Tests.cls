
@isTest
private class Einstein_HttpBodyPartTraining_1_Tests {

    // ... previous test methods remain unchanged ...

    // Corrected test method for handling a case where the 'name' parameter is empty
    @isTest
    static void testBuildWithEmptyName() {
        Boolean exceptionThrown = false;
        try {
            Einstein_HttpBodyPartTraining bodyPartTraining = new Einstein_HttpBodyPartTraining(1L, '', 10, 0.001, new Einstein_TrainParams());
            Blob resultBlob = bodyPartTraining.build(); // This should throw an exception
        } catch (Einstein_StringIsEmptyException e) {
            exceptionThrown = true;
            // Asserting that the exception message contains the correct field name
            System.assert(e.getMessage().contains('name'), 'The exception message should contain the field name "name".');
        }
        
        System.assert(exceptionThrown, 'An Einstein_StringIsEmptyException should have been thrown due to an empty name');
    }

    // ... additional test methods ...
}
