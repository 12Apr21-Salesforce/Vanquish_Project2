@isTest
public with sharing class TeacherExtensionTest {
    @isTest
    private static void TeacherExtensionTest() {
        // Teacher__c teach = [SELECT Name From Teacher__c where ID = 'a0N5e000000RAQhEAO'];
        // Teacher needs education and Name
        // Class needs Name, Class Size, and Teacher
        // CMT needs Class, Day__c, Start_Time__c, End_Time__c
        // Student needs Name, GPA, Grade Level, and Graduation Date
        // jC needs Name, Class, and Student 
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


        PageReference TeacherSchedule = new PageReference (Page.TeacherSchedule.geturl()+'?id='+teach.id);
        Test.setCurrentPage(TeacherSchedule);

        Test.startTest();
        ApexPages.StandardController sc = new ApexPages.StandardController(teach);
        TeacherExtension teachEx = new TeacherExtension(sc);
        TeacherExtension teachEx2 = new TeacherExtension(teach); // test for the overload method
        Test.stopTest();
        // test
        

        System.assertEquals(teachEx.classes[0].classVar.name, cls.name);
        System.assertNotEquals(teachEx.classes[0].jc,null);
        System.assertNotEquals(teachEx.classes[0].meetingTime,null);
        System.assertEquals(TeacherExtension.dayweek(Date.newInstance(2021, 5, 28)),'Friday');

        
    }
    private static void TeacherExtensionNegativeTest() {

    }
}