public with sharing class StudentScheduleApex {
    @AuraEnabled
    public static List<Student__c> getStudent() {
        
        List<Student__c> s = [SELECT Name, Grade_Level__c FROM Student__c];
        // strip inaccessable goes hereish
        return s;
    }

    @AuraEnabled
    public static List<Junction_Class__c> getSchedule(String stu) {
        
        List<Junction_Class__c> s = [SELECT Name, Class__c, Student__c FROM Junction_Class__c WHERE Student__r.Name = :stu];
        
        // strip inaccessable goes hereish
        return s;
    }
}