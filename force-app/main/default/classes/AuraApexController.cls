public with sharing class AuraApexController {

    @AuraEnabled
    public static List<Teacher__c> getTeachers(){
        try {
            List<Teacher__c> totalList = [SELECT Name FROM Teacher__c]; 
            return totalList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Class_Meeting_Time__c> getWeeklyMeetingTimes(Teacher__c tea){
        try {
            String id = tea.id;
            List<Class_Meeting_Time__c> weeklyMeetings = [SELECT Class_Name__c, Campus_Location__c, 
                Start_Time__c, End_Time__c, Duration__c, Day__c  FROM Class_Meeting_Time__c WHERE Class__r.Teacher__c=:id ORDER BY Day__c];
            System.debug(weeklyMeetings);
            return weeklyMeetings;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Class_Meeting_Time__c> getTodayMeetingTimes(Teacher__c tea, String day){
        try {
            String id = tea.id;
            List<Class_Meeting_Time__c> dailyMeetings = [SELECT Class_Name__c, Campus_Location__c,
                Start_Time__c, End_Time__c  FROM Class_Meeting_Time__c 
                WHERE Class__r.Teacher__c=:id AND Day__c=:day ORDER BY Start_Time__c];
                system.debug(dailyMeetings);
            return dailyMeetings;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}