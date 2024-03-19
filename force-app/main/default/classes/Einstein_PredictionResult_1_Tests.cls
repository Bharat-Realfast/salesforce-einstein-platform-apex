
@isTest
private class Einstein_PredictionResult_1_Tests {
    
    private static Einstein_Probability createProbability(String label, Double probability) {
        // Assuming Einstein_Probability has a constructor that accepts label and probability
        return new Einstein_Probability(label, probability);
    }

    @isTest
    static void testFilterWithMatchingItems() {
        Einstein_PredictionResult predictor = new Einstein_PredictionResult();
        predictor.probabilities = new List<Einstein_Probability>{
            createProbability('Label1', 0.95),
            createProbability('Label2', 0.85),
            createProbability('Label1', 0.75)
        };

        List<Einstein_Probability> filtered = predictor.filter('Label1', 0.7);
        System.assertEquals(2, filtered.size(), 'Should return 2 items');
        System.assertEquals('Label1', filtered[0].label, 'First item should have the correct label');
        System.assertEquals('Label1', filtered[1].label, 'Second item should have the correct label');
    }

    @isTest
    static void testFilterWithNoMatchingItems() {
        Einstein_PredictionResult predictor = new Einstein_PredictionResult();
        predictor.probabilities = new List<Einstein_Probability>{
            createProbability('Label2', 0.95),
            createProbability('Label3', 0.85)
        };

        List<Einstein_Probability> filtered = predictor.filter('Label1', 0.7);
        System.assertEquals(0, filtered.size(), 'Should return 0 items');
    }

    @isTest
    static void testFilterWithEmptyList() {
        Einstein_PredictionResult predictor = new Einstein_PredictionResult();
        predictor.probabilities = new List<Einstein_Probability>();

        List<Einstein_Probability> filtered = predictor.filter('Label1', 0.7);
        System.assertEquals(0, filtered.size(), 'Should return an empty list');
    }

    @isTest
    static void testFilterWithNullList() {
        Einstein_PredictionResult predictor = new Einstein_PredictionResult();
        predictor.probabilities = null;

        List<Einstein_Probability> filtered = predictor.filter('Label1', 0.7);
        System.assertEquals(new List<Einstein_Probability>(), filtered, 'Should return an empty list');
    }

    @isTest
    static void testFilterWithThresholdEdgeCase() {
        Einstein_PredictionResult predictor = new Einstein_PredictionResult();
        predictor.probabilities = new List<Einstein_Probability>{
            createProbability('Label1', 0.7),
            createProbability('Label1', 0.65)
        };

        List<Einstein_Probability> filtered = predictor.filter('Label1', 0.7);
        System.assertEquals(1, filtered.size(), 'Should return 1 item');
        System.assertEquals(0.7, filtered[0].probability, 'The first item's probability should be at the threshold');
    }
}
