@isTest
public with sharing class StudentApexController_Test {
    
      
  
    
    @istest
    private static void checkget2day(){
        

        Test.startTest();
        System.assertEquals(System.now().format('EEEE'), StudentScheduleApex.getToday());
        
        
        Test.stopTest();
    }
    @istest
    private static void checkgetstudent(){

        //*
        List<Student__c> s = [SELECT Name, GPA__c, Approved_for_Gradution__c, Grade_Level__c, 
        Graduation_Date__c, Has_Graduated__c,Student_Counselor__c FROM Student__c];
        //*/
    
        Student__c stu = new Student__c(Name = 'test 1', GPA__c = 4.3, Approved_for_Gradution__c = true, Grade_level__c = '11th', 
                        Graduation_Date__c = Date.today(), Has_Graduated__c = false);
        
       
        insert stu;
        
        Test.startTest();
        System.assertEquals(stu.Name, StudentScheduleApex.getStudent().get(0).Name);
        
        
        Test.stopTest();
    }

    @istest
    private static void checkgetsched(){

        Student__c stu = new Student__c(Name = 'test 1', GPA__c = 4.3, Approved_for_Gradution__c = true, Grade_level__c = '11th', 
                        Graduation_Date__c = Date.today(), Has_Graduated__c = false);
         insert stu;
        Teacher__c t = new Teacher__c(Education__c = 'Masters', Name = 'dave');
       
        
        insert t;
        Class__c cls = new Class__c(Name = 'pain', Teacher__c = t.id, Class_Size__c = 400);
        insert cls;

        Class_Meeting_Time__c mt = new Class_Meeting_Time__c(Class__c = cls.Id, Day__c = 'Monday', Start_Time__c = Time.newInstance(10, 0, 0, 0), End_Time__c = Time.newInstance(14, 0, 0, 0) );
        insert mt;

        Junction_Class__c jc = new Junction_Class__c(Student__c = stu.Id, Class__c = cls.Id);
        List<String> s = new List<String>();
        s.add(stu.Name);

       
        
        insert jc;


        System.assert(StudentScheduleApex.getSchedule(s).containsKey(stu.Name));
        
    }
  
}


