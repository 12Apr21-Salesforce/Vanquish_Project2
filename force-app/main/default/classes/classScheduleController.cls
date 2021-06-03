public with sharing class classScheduleController {
//Previous version of StudentScheduleController.cls, in case there needs to be a complete day-to-day schedule for classes

// *Currently not functional* *Remove this comment if put into use*

    final public Student__c currentStudent{get; private set;}

    public List<Class__c> studentClasses{get; private set;}


    public classScheduleController() {
        currentStudent = [SELECT Id, Name, GPA__c, Approved_For_Gradution__c, Grade_Level__c, Graduation_Date__c, Student_Counselor__c,
                            (SELECT Class__c FROM Junctions__r)
                            FROM Student__c WHERE Id = :ApexPages.currentPage().getParameters().get('id') ];

        List<Id> classIds = new List<Id>();

        for (Junction_Class__c cSJ : currentStudent.Junctions__r){
            classIds.add(cSJ.Class__c);
        }

        studentClasses = [SELECT Id, Name, Campus__c, Address__c, Teacher__c, (SELECT Day__c, Start_Time__c, End_Time__c, Duration__c
                            FROM Class_Meeting_Times1__r) FROM Class__c WHERE Id IN :classIds]; 
        
    }
}