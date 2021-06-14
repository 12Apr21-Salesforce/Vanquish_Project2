public with sharing class StudentsVsClubs {
 
    @AuraEnabled(cacheable=true)
    public static List<Junction_Club__c> fetchStudentsClubs() {
  
        List<Junction_Club__c> stuClubList= [select Name, student__c, club__c, Student__r.Name, Student__r.GPA__c, 
        Student__r.Grade_Level__c, Club__r.Name, club__r.Club_Size__c from Junction_Club__c];

        return stuClubList;
    }
}