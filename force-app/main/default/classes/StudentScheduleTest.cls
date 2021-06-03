@isTest
public class StudentScheduleTest {

    //Teacher__c teach = [SELECT Name From Teacher__c where ID = 'a0N5e000000RAQhEAO'];
    // Teacher needs education and Name
    // Class needs Name, Class Size, and Teacher
    // CMT needs Class, Day__c, Start_Time__c, End_Time__c
    // Student needs Name, GPA, Grade Level, and Graduation Date
    // jC needs Name, Class, and Student 

    private static String getDoW(){
        return System.now().format('EEEE');
    }

    private static Student__c newStudent(){
        return new Student__c(Name='Test', GPA__c=3.0, Grade_Level__c='11th', Graduation_Date__c=Date.newInstance(2022, 1, 1));
    }
    private static Teacher__c newTeacher(){
        return new Teacher__c(Name='Test', Education__c='Masters');
    }
    private static Class__c newClass(Teacher__c tTeacher){
        return new Class__c(Name='Test', Class_Size__c=20, Teacher__c=tTeacher.Id);
    }
    private static Junction_Class__c newJC(Class__c tClass, Student__c tStudent){
        return new Junction_Class__c(Class__c=tClass.Id, Student__c=tStudent.Id);
    }
    private static List<Class_Meeting_Time__c> newTimes(Class__c tClass){
        List<Class_Meeting_Time__c> tTimes = new List<Class_Meeting_Time__c>();

        Map<Integer,String> dowMap = DOWm.getDowMap();

        for (integer dayNum=0; dayNum<=4; ++dayNum){
            tTimes.add(new Class_Meeting_Time__c(Class__c=tClass.Id, Day__c=dowMap.get(dayNum), Start_Time__c=Time.newInstance(10, 0, 0, 0), End_Time__c=Time.newInstance(11, 0, 0, 0)));
        }
        return tTimes;
    }
    private static PageReference makePage(Student__c tStudent){
        PageReference tPage = Page.StudentSchedule;
        tPage.getParameters().put('id', tStudent.Id);
        return tPage;
    }
    
    /*
    @testSetup
    private static void loadTestData(){
        Student__c tStudent = newStudent();
        insert tStudent;
        Teacher__c tTeacher = newTeacher();
        insert tTeacher;
        Class__c tClass = newClass();
        insert tClass;
        List<Class_Meeting_Time__c> tTimes = newTimes(tClass);
        insert tTimes;
    }
    */

    @isTest
    private static void ensureDoW(){
        Student__c tStudent = newStudent();
        insert tStudent;
        PageReference testPage = makePage(tStudent);
        Test.setCurrentPage(testPage);
        StudentScheduleController tSST = new StudentScheduleController();
        System.assertEquals(tSST.dayOfWeek, getDoW());
    }

    @isTest
    public static void ensureStudentVar() {
        Student__c tStudent = newStudent();
        insert tStudent;
        PageReference testPage = makePage(tStudent);
        Test.setCurrentPage(testPage);
        StudentScheduleController tSST = new StudentScheduleController();
        System.assertEquals(tSST.currentStudent.Id, tStudent.Id);
        System.assertEquals(tSST.currentStudent.Name, tStudent.Name);
        System.assertEquals(tSST.currentStudent.GPA__c, tStudent.GPA__c);
        System.assertEquals(tSST.currentStudent.Grade_Level__c, tStudent.Grade_Level__c);
        System.assertEquals(tSST.currentStudent.Graduation_Date__c, tStudent.Graduation_Date__c);
    }

    @isTest
    private static void ensureClassList(){
        Student__c tStudent = newStudent();
        insert tStudent;
        Teacher__c tTeacher = newTeacher();
        insert tTeacher;
        Class__c tClass = newClass(tTeacher);
        insert tClass;
        Junction_Class__c tJC= newJC(tClass, tStudent);
        insert tJC;
        PageReference testPage = makePage(tStudent);
        Test.setCurrentPage(testPage);
        StudentScheduleController tSST = new StudentScheduleController();
        for (Class__c c : tSSt.studentClasses){
            System.assertEquals(c.Id, tClass.Id);
            System.assertEquals(c.Name, tClass.Name);
            System.assertEquals(c.Teacher__c, tClass.Teacher__c);
        }
    }

    @isTest
    private static void ensureMeetingTimeListOrder(){
        Student__c tStudent = newStudent();
        insert tStudent;
        Teacher__c tTeacher = newTeacher();
        insert tTeacher;
        Class__c tClass = newClass(tTeacher);
        insert tClass;
        Junction_Class__c tJC = newJC(tClass, tStudent);
        insert tJC;
        List<Class_Meeting_Time__c> tTimes = newTimes(tClass);
        insert tTimes;
        PageReference testPage = makePage(tStudent);
        Test.setCurrentPage(testPage);
        StudentScheduleController tSST = new StudentScheduleController();

        //Assert that each subsequent Class_Meeting_Time__c in the list starts after the previous one
        Class_Meeting_Time__c prev = new Class_Meeting_Time__c(Day__c='Monday', Start_Time__c=Time.newInstance(6, 0, 0, 0), End_Time__c=Time.newInstance(7, 0, 0, 0));
        for (Class_Meeting_Time__c cMT : tSST.todaysClassTimes){
            System.assert(CMT.Start_Time__c > prev.Start_Time__c);
            prev = cMT;
        }
    }

    @isTest
    private static void ensureMeetingTimeDay(){
        Student__c tStudent = newStudent();
        insert tStudent;
        Teacher__c tTeacher = newTeacher();
        insert tTeacher;
        Class__c tClass = newClass(tTeacher);
        insert tClass;
        Junction_Class__c tJC = newJC(tClass, tStudent);
        insert tJC;
        List<Class_Meeting_Time__c> tTimes = newTimes(tClass);
        insert tTimes;
        PageReference testPage = makePage(tStudent);
        Test.setCurrentPage(testPage);
        StudentScheduleController tSST = new StudentScheduleController();

        //Assert that all Class_Meeting_Time__c s in todaysClassTimes occur on the current day of the week
        for (Class_Meeting_Time__c cMT : tSST.todaysClassTimes){
            System.assertEquals(cMT.Day__c, getDoW());
        }
    }

    @isTest
    private static void ensureHasClassTodayCheck(){

        Student__c tStudent = newStudent();
        insert tStudent;
        Teacher__c tTeacher = newTeacher();
        insert tTeacher;
        Class__c tClass = newClass(tTeacher);
        insert tClass;
        Junction_Class__c tJC = newJC(tClass, tStudent);
        insert tJC;

        Map<String,Integer> dowNumMap = DOWm.getDowNumMap();

        List<Class_Meeting_Time__c> blankTimes = newTimes(tClass);
        blankTimes.remove(dowNumMap.get(getDoW()));
        insert blankTimes;

        PageReference testPage = makePage(tStudent);
        Test.setCurrentPage(testPage);
        StudentScheduleController tSST = new StudentScheduleController();

        System.assert(tSST.noClassesToday==true);


    }

    @isTest
    private static void ensureHasClassCheck(){

        Student__c tStudent = newStudent();
        insert tStudent;
        Teacher__c tTeacher = newTeacher();
        insert tTeacher;
        Class__c tClass = newClass(tTeacher);
        insert tClass;

        List<Class_Meeting_Time__c> tTimes = newTimes(tClass);
        insert tTimes;
        PageReference testPage = makePage(tStudent);
        Test.setCurrentPage(testPage);
        StudentScheduleController tSST = new StudentScheduleController();

        System.assert(tSST.noClasses==true);

    }
}