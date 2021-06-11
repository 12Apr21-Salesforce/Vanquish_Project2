
public with sharing class AuraApexController {
    
    @AuraEnabled(cacheable=true)
    public static List<Id> getTeacherIds() {
        List<Teacher__c> teachList = [SELECT Id FROM Teacher__c]; 
        List<Id> teachIds = new List<Id>();

        for (Teacher__c t : teachList) {
            teachIds.add(t.Id);
        }

        return teachIds;
    }

    @AuraEnabled(cacheable=true)
    public static List<String> getTeacherNames() {
        try {
            List<Teacher__c> teachList = [SELECT Name FROM Teacher__c]; 
            List<String> teachNames = new List<String>();
            
            for (Teacher__c t : teachList) {
                teachNames.add(t.Name);
            }
            return teachNames;

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Teacher__c> getTeachers(){
        try {
            List<Teacher__c> totalList = [SELECT Name FROM Teacher__c]; 
            return totalList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
