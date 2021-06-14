@IsTest
public with sharing class UniversityTestDataFactory {


    public static List<University__c> createUnivs (Integer numUnis) {

        List<University__c> uni = new List<University__c>();

        for(Integer i=0; i < numUnis; i++) {
            University__c u = new University__c(Name= i + ' University');
            uni.add(u);
        }

        insert uni;
        return uni;

    }
}