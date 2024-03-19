
@isTest
public class Einstein_HttpBodyPartRetraining_6_Tests {

    @testSetup
    static void setup() {
        // No setup required for these tests since there is no DML and no org-dependent data being used.
    }
    
    // Test to confirm that getLearningRate returns the correct value when set
    @isTest
    static void testGetLearningRateHappyPath() {
        Decimal expectedRate = 0.001;
        Einstein_HttpBodyPartRetraining bodyPartRetraining = new Einstein_HttpBodyPartRetraining('123', 5, expectedRate, null);
        
        Decimal actualRate = bodyPartRetraining.getLearningRate();
        
        // Assert that the expected learningRate is returned
        System.assertEquals(expectedRate, actualRate, 
            'The learningRate should be the same as the value set in constructor.');
    }
    
    // Test to confirm that getLearningRate returns null if learningRate is not set (or is set to null)
    @isTest
    static void testGetLearningRateSadPath() {
        Einstein_HttpBodyPartRetraining bodyPartRetraining = new Einstein_HttpBodyPartRetraining('123', 5, null, null);
        
        Decimal actualRate = bodyPartRetraining.getLearningRate();
        
        // Assert that the learningRate is null when not set
        System.assertEquals(null, actualRate, 
            'The learningRate should be null since it was not set.');
    }
    
    // There are no exceptional scenarios to test for getLearningRate() specifically
}
