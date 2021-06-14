@isTest
public with sharing class AuraApexController_Test {

    @TestSetup
    static void makeData(){
        //data creation
        Teacher__c teach = new Teacher__c(Name='Banner Banner',Education__c='Masters');
        insert teach;
        Class__c cls = new Class__c(Name='Business',Class_Size__c=10,Teacher__c = teach.id);
        insert cls;
        Time stTm = Time.newInstance(11, 30, 0, 0);
        Time enTm = Time.newInstance(13, 30, 0, 0);
        List<String> dayOfWeek = new List<String>{'Monday','Tuesday','Wednesday','Thursday','Friday'};
        List<Class_Meeting_Time__c> cmt = new List<Class_Meeting_Time__c>();
        for(String day : dayOfWeek){
            cmt.add(new Class_Meeting_Time__c(Day__c=day,Start_Time__c=stTm,End_Time__c=enTm, class__c = cls.id));
        }
        insert cmt;

        List<Student__c> stuList = new List<Student__c>();
        Date dt = Date.newInstance(2021, 6, 3);
        for(integer i = 0;i<2;i++){
            stuList.add(new Student__c(Name='Student'+i,Gpa__c=3,Grade_level__c = '12th',Graduation_Date__c=dt));
        }
        insert stuList;

        List<Junction_Class__c> jcList = new List<Junction_Class__c>();

        for(Student__c stu : stuList){
            jcList.add(new Junction_Class__c(Student__c=stu.id,Class__c=cls.id));
        }

        insert jcList;       

    }

         
        //single case test
        @isTest
        private static void test1() {

            String a = 'abc@123.com';
            String b = 'hello';
            String c = 'world';

            Teacher__c teach = [SELECT Name FROM Teacher__c LIMIT 1];
            Class_Meeting_Time__c cmt = [SELECT Class_Name__c, Day__c FROM Class_Meeting_Time__c LIMIT 1];
            Class__c cls = [SELECT Id FROM Class__c LIMIT 1];

            Test.startTest();
            List<Teacher__c> t = AuraApexController.getTeachers();
            List<Class_Meeting_Time__c> weekly = AuraApexController.getWeeklyMeetingTimes(teach);
            List<Class_Meeting_Time__c> today = AuraApexController.getTodayMeetingTimes(teach, cmt.Day__c);
            List<Class__c> roster = AuraApexController.getRoster(teach);
            List<Junction_Class__c> junction = AuraApexController.getStudents(cls);
            AuraApexController.sendMailMethod(a,b,c);
            Test.stopTest();

            System.assertEquals(t[0].Name, 'Banner Banner');
            System.assertEquals(roster[0].Name, 'Business');
            System.assertNotEquals(junction[0], null);
            System.assertEquals(weekly[0].Class_Name__c, 'Business');
            System.assertEquals(today[0].Class_Name__c, 'Business');
    }
}