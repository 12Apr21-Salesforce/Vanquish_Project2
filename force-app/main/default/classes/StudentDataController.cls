public with sharing class StudentDataController {

    @AuraEnabled
    public static List<Student__c> getStudents (){

        List<Student__c> students = [SELECT Id, Name, GPA__c, Grade_Level__c, Student_Counselor__r.Name FROM Student__c];

        return students;

    }

    @AuraEnabled
    public static List<Student__c> getHonorRoll(){
        
        List<Student__c> honor = [SELECT Id, Name, GPA__c, Grade_Level__c FROM Student__c
                                    WHERE GPA__c >= 3.49];

        return honor;

    }

    @AuraEnabled
    public static List<Student__c> getGrads(){
        
        List<Student__c> grads = [SELECT Id, Name, GPA__c, Grade_Level__c, Approved_for_Gradution__c FROM Student__c
                                    WHERE Approved_for_Gradution__c = true];

        return grads;

    }
        
}