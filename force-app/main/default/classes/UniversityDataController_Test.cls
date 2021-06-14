@IsTest
public with sharing class UniversityDataController_Test {

    @IsTest
    private static void testUnivSOQL() {

        University__c uni = new University__c(Name='Test University');

            insert uni;

        University__c uni2 = new University__c(Name='Honor University', Honor_Roll_Required__c = true);

            insert uni2;

        Test.startTest();

        List<University__c> univs = UniversityDataController.getUniversities();
        List<University__c> honor = UniversityDataController.getHonorRoll();
      
        Test.stopTest();

        System.assertEquals(univs[0].Name, 'Test University');
        System.assertEquals(honor[0].Name, 'Honor University');

    }
}