public with sharing class StudentScheduleController {


    final public Student__c currentStudent{get; private set;}

    final public String dayOfWeek{get; private set;}

    public List<Class__c> studentClasses{get; private set;}
    public List<Class__C> todaysClasses{get; private set;}
    public List<Class_Meeting_Time__c> todaysClassTimes{get; private set;}


    /*
    public PageReference test(){
        PageReference testing = new PageReference('/apex/StudentSchedule?id=a0M5e000000uxOBEAY');
        testing.setRedirect(true);
        return testing;
    }
    */

    transient public Boolean noClasses{
        get{
            if (noClasses==NULL)
                noClasses = (studentClasses.size()==0);
            return noClasses;
        }
        private set{

        }
    }

    transient public Boolean noClassesToday{
        get{
            if (noClassesToday==NULL)
                noClassesToday = (todaysClasses.size()==0);
            return noClassesToday;
        }
        private set{

        }
    }
 

/*
    public static void swap(List<Class_Meeting_Time__c> swapList, integer i1, integer i2){
        Class_Meeting_Time__c temp = new Class_Meeting_Time__c;

        temp = swapList[i2];
        swapList[i2] = swapList[i1];
        swapList[i1] = temp;
    }

*/

    public StudentScheduleController() {


        //Query for the current student's information
        currentStudent = [ SELECT Id, Name, GPA__c, Approved_For_Gradution__c, Grade_Level__c, Graduation_Date__c, Student_Counselor__c,
                            (SELECT Class__c FROM Junctions__r)
                            FROM Student__c WHERE Id = :ApexPages.currentPage().getParameters().get('id') ];

        dayOfWeek = System.now().format('EEEE');


        //Obtain a list of the current student's classes

        List<Id> classIds = new List<Id>();

        for (Junction_Class__c cSJ : currentStudent.Junctions__r){
            classIds.add(cSJ.Class__c);
        }

        studentClasses = [ SELECT Id, Name, Campus__c, Address__c, Teacher__c, (SELECT Day__c, Start_Time__c, End_Time__c, Duration__c, Class_Name__c
                            FROM Class_Meeting_Times1__r) FROM Class__c WHERE Id IN :classIds ORDER BY Name];


        //Sort through the class list, and create a list of class meeting times that occur today

        todaysClasses = new List<Class__c>();
        todaysClassTimes = new List<Class_Meeting_Time__c>();
        
        for (Class__c cl : studentClasses){
            boolean occursToday = false;
            for (Class_Meeting_Time__c classMeetingTime : cl.Class_Meeting_Times1__r){
                if (classMeetingTime.Day__c == dayOfWeek){
                    occursToday = true;
                    todaysClassTimes.add(classMeetingTime);
                }
            }
            System.debug(cl);
            if (occursToday)
                todaysClasses.add(cl);
        }


        //Sort the meeting times according to compareTo logic in ClassMeetingTimeWrapper, i.e. by start time

        todaysClassTimes.sort();

    }
}