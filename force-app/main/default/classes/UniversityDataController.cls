public with sharing class UniversityDataController {

    @AuraEnabled
    public static List<University__c> getUniversities (){

        List<University__c> universities = [SELECT Id, Name, GPA_Required__c, Honor_Roll_Required__c, City_Name__c, State__c FROM University__c];

        return universities;

    }

    @AuraEnabled
    public static List<University__c> getHonorRoll(){
        
        List<University__c> honor = [SELECT Id, Name, GPA_Required__c, Honor_Roll_Required__c, City_Name__c, State__c FROM University__c WHERE Honor_Roll_Required__c = true];

        return honor;

    }
        
}