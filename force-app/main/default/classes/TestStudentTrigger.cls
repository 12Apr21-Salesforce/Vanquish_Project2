@isTest
private class TestStudentTrigger {
    @testSetup static void studentCreation(){
        List<Student__c> tStudents = new List<Student__c>();
        Integer i = 0;
        Boolean change = false;
        Student__c testS = null;
        while(i < 200){
            if(!change){
                 	testS = new Student__c(
                    Name = 'Test Student',
                    Grade_Level__c = '12th',
                    GPA__c = 4.0,
                    Approved_for_Gradution__c = false,
                    Graduation_Date__c = Date.newInstance(2021, 5, 10),
                    Behavior__c = 'Good',
                    Parent_First_Name__c = 'Test',
                    Parent_Last_Name__c = 'Parent',
                    Parent_Email__c = 'TestParent@aol.com'
                );
                change = true;
            } else{
                	testS = new Student__c(
                    Name = 'Test Student',
                    Grade_Level__c = '11th',
                    GPA__c = 4.0,
                    Approved_for_Gradution__c = false,
                    Graduation_Date__c = Date.newInstance(2022, 5, 10),
                    Behavior__c = 'Good',
                    Parent_First_Name__c = 'Test',
                    Parent_Last_Name__c = 'Parent',
                    Parent_Email__c = 'TestParent@aol.com'
                );
               		change = false;
            }
            tStudents.add(testS);
            i++;
        }
        insert tStudents;
    }
    
    @isTest static void approvedDelete(){
        List<Student__c> test = [SELECT Name, Grade_Level__c, GPA__c, Approved_for_Gradution__c, Graduation_Date__c, Behavior__c
                                FROM Student__c];
        delete test;
        
    }
    
    @isTest static void nonApprovedDelete(){
        List<Student__c> test = [SELECT Name, Grade_Level__c, GPA__c, Approved_for_Gradution__c, Graduation_Date__c, Behavior__c
                                FROM Student__c];
        Database.delete(test);
        
    }
}