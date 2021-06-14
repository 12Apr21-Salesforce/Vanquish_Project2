public with sharing class MyUniversityController {

    @AuraEnabled
    public static List<University__c> findUniversities (Id recordId, Decimal rangeGPA) {

        List<University__c> university = [SELECT GPA_Required__c  FROM University__c WHERE Id=:recordId];

        Decimal requiredGPA = university[0].GPA_Required__c;

        List<University__c> similarUniversities = getSimilarUniversities(recordId, rangeGPA, requiredGPA);
        
        return similarUniversities;
    }

    private static List<University__c> getSimilarUniversities (Id recordId, Decimal rangeGPA, Decimal GPA ) {

    Decimal range;

    if (rangeGPA == null) {
        range = .50;
    } else {
        range = rangeGPA;
    }

    return [
        SELECT Id, Name, City_Name__c, State__c, GPA_Required__c, Honor_Roll_Required__c 
        FROM University__c WHERE Id != :recordId AND GPA_Required__c > :GPA - range AND GPA_Required__c < :GPA + range];

    }
}
