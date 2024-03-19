
@isTest
private class Einstein_Invocable_Language_3_Tests {
    
    // Happy Path - Test that the dedupeLRs method can process a list of LanguageRequest objects
    @isTest
    static void testDedupeLRsWithDuplicatesReturnsList() {
        // Given
        Einstein_Invocable_Language.LanguageRequest lr1 = new Einstein_Invocable_Language.LanguageRequest();
        lr1.RecordId = '001xx000003GvHOAA0';
        lr1.FieldToAnalyze = 'Description';
        
        Einstein_Invocable_Language.LanguageRequest lr2 = new Einstein_Invocable_Language.LanguageRequest();
        lr2.RecordId = '001xx000003GvHOAA0';
        lr2.FieldToAnalyze = 'Description';
        
        List<Einstein_Invocable_Language.LanguageRequest> input = new List<Einstein_Invocable_Language.LanguageRequest> { lr1, lr2 };

        // When
        List<Einstein_Invocable_Language.LanguageRequest> result = Einstein_Invocable_Language.dedupeLRs(input);

        // Then
        System.assertNotEquals(null, result, 'The method should return a list, not null.');
        System.assertEquals(input.size(), result.size(), 'Size of the result list should be equal to the size of the input list.');
    }

    // Sad Path - Test that the dedupeLRs method can handle an empty list
    @isTest
    static void testDedupeLRsWithEmptyList() {
        // Given
        List<Einstein_Invocable_Language.LanguageRequest> input = new List<Einstein_Invocable_Language.LanguageRequest>();

        // When
        List<Einstein_Invocable_Language.LanguageRequest> result = Einstein_Invocable_Language.dedupeLRs(input);

        // Then
        System.assertNotEquals(null, result, 'The method should return a list, not null.');
        System.assertEquals(0, result.size(), 'The method should return an empty list when the input list is empty.');
    }

    // Exceptional Path - Test that dedupeLRs throws a NullPointerException when given a null input
    @isTest
    static void testDedupeLRsWithNullList() {
        // Given
        List<Einstein_Invocable_Language.LanguageRequest> input = null;
        
        // When
        Boolean exceptionThrown = false;
        try {
            List<Einstein_Invocable_Language.LanguageRequest> result = Einstein_Invocable_Language.dedupeLRs(input);
        } catch (NullPointerException e) {
            exceptionThrown = true;
        }
        
        // Then
        System.assert(exceptionThrown, 'A NullPointerException should be thrown when the input list is null.');
    }
}
