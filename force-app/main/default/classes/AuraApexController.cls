//controller used with Aura Component TeacherSchedulePage
public with sharing class AuraApexController {
    
    @AuraEnabled(cacheable=true)
    public static List<Id> getTeacherIds() {
        List<Teacher__c> teachList = [SELECT Id FROM Teacher__c]; 
        List<Id> teachIds = new List<Id>();


    @AuraEnabled
    public static List<Teacher__c> getTeachers(){
        try{
            List<Teacher__c> totalList = [SELECT Name, Email__c FROM Teacher__c]; 
            return totalList;
        } catch (Exception e) { throw new AuraHandledException(e.getMessage());}


    }

    @AuraEnabled(cacheable=true)
    public static List<String> getTeacherNames() {
        try {

            String id = tea.id;
            List<Class_Meeting_Time__c> weeklyMeetings = [SELECT Class_Name__c, Campus_Location__c, Class_Span__c, Duration__c, Day__c, Class__c
                                                        FROM Class_Meeting_Time__c 
                                                        WHERE Class__r.Teacher__c=:id 
                                                        ORDER BY Day__c];
            return weeklyMeetings;
        } catch (Exception e) { throw new AuraHandledException(e.getMessage());}

    }

    @AuraEnabled
    public static List<Teacher__c> getTeachers(){
        try {

            String id = tea.id;
            List<Class_Meeting_Time__c> dailyMeetings = [SELECT Class_Name__c, Campus_Location__c, Class_Span__c, Duration__c
                                                        FROM Class_Meeting_Time__c 
                                                        WHERE Class__r.Teacher__c=:id AND Day__c=:day
                                                        ORDER BY Start_Time__c];
            return dailyMeetings;
        } catch (Exception e) { throw new AuraHandledException(e.getMessage());}
    }

    @AuraEnabled
    public static List<Class__c> getRoster(Teacher__c tea){
        try {
            String id = tea.id;
            List<Class__c> classes = [SELECT Name, Class_Count__c
                                    FROM Class__c
                                    WHERE Teacher__c=:id];
            return classes;
        } catch (Exception e) { throw new AuraHandledException(e.getMessage());}
    }

    @AuraEnabled
    public static List<Junction_Class__c> getStudents(Class__c cla){
        try {
            String id = cla.id;
            List<Junction_Class__c> students = [SELECT Class__c, Student__c, Student__r.Name, Class__r.Name 
                                                FROM Junction_Class__c
                                                WHERE Class__c=:id];
            return students;
        } catch (Exception e) { throw new AuraHandledException(e.getMessage());}

    }
 
    @AuraEnabled 
    public static void sendMailMethod(String mMail ,String mSubject ,String mbody){
    
        List<Messaging.SingleEmailMessage> mails =  new List<Messaging.SingleEmailMessage>();     

        // Step 1: Create a new Email
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        // Step 2: Set list of people who should get the email
        List<String> sendTo = new List<String>();
        sendTo.add(mMail);
        mail.setToAddresses(sendTo);
        
        // Step 3: Set who the email is sent from
        mail.setReplyTo('natalie.clark@revature.net'); // change it with your mail address.
        mail.setSenderDisplayName('Anonymous Message from Website'); 
        
        // Step 4. Set email contents - you can use variables!
        mail.setSubject(mSubject);
        mail.setHtmlBody(mbody);
        
        // Step 5. Add your email to the master list
        mails.add(mail);
        
        // Step 6: Send all emails in the master list
        Messaging.sendEmail(mails);
    
    }   
}