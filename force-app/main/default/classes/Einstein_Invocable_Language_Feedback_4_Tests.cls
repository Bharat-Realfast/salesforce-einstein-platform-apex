
@isTest
public class EILF_Test {

    @isTest
    private static void testDedupeWithDuplicates() {
        // Arrange
        Einstein_Invocable_Language_Feedback.LanguageFeedback lf1 = new Einstein_Invocable_Language_Feedback.LanguageFeedback();
        lf1.ModelId = 'model1';
        lf1.Text = 'text1';
        lf1.Label = 'label1';
        
        Einstein_Invocable_Language_Feedback.LanguageFeedback lf2 = lf1.clone(); // Duplicate
        
        List<Einstein_Invocable_Language_Feedback.LanguageFeedback> input = new List<Einstein_Invocable_Language_Feedback.LanguageFeedback>{ lf1, lf2 };
        
        // Act
        List<Einstein_Invocable_Language_Feedback.LanguageFeedback> result = Einstein_Invocable_Language_Feedback.dedupeLFs(input);
        
        // Assert
        System.assertEquals(1, result.size(), 'There should be only one unique LanguageFeedback record after deduplication.');
    }

    @isTest
    private static void testDedupeWithoutDuplicates() {
        // Arrange
        Einstein_Invocable_Language_Feedback.LanguageFeedback lf1 = new Einstein_Invocable_Language_Feedback.LanguageFeedback();
        lf1.ModelId = 'model1';
        lf1.Text = 'text1';
        lf1.Label = 'label1';
        
        Einstein_Invocable_Language_Feedback.LanguageFeedback lf2 = new Einstein_Invocable_Language_Feedback.LanguageFeedback();
        lf2.ModelId = 'model2';
        lf2.Text = 'text2';
        lf2.Label = 'label2';
        
        List<Einstein_Invocable_Language_Feedback.LanguageFeedback> input = new List<Einstein_Invocable_Language_Feedback.LanguageFeedback>{ lf1, lf2 };
        
        // Act
        List<Einstein_Invocable_Language_Feedback.LanguageFeedback> result = Einstein_Invocable_Language_Feedback.dedupeLFs(input);
        
        // Assert
        System.assertEquals(2, result.size(), 'There should be two unique LanguageFeedback records as there are no duplicates.');
    }

    @isTest
    private static void testDedupeWithEmptyList() {
        // Arrange
        List<Einstein_Invocable_Language_Feedback.LanguageFeedback> input = new List<Einstein_Invocable_Language_Feedback.LanguageFeedback>();
        
        // Act
        List<Einstein_Invocable_Language_Feedback.LanguageFeedback> result = Einstein_Invocable_Language_Feedback.dedupeLFs(input);
        
        // Assert
        System.assertEquals(0, result.size(), 'The result should be an empty list.');
    }
}
