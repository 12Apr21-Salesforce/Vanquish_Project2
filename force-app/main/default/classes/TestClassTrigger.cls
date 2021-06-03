@isTest
private class TestClassTrigger{

    @TestSetup
    static void makeData(){
        List<Student__c> tStudents = new List<Student__c>();
        Integer i = 0;
        Boolean change = false;
        Student__c testS = null;
        //populate parent fields outside of my control flow
        while(i < 30){
            if(!change){
                 	testS = new Student__c(
                    Name = 'Test Student',
                    Grade_Level__c = '12th',
                    GPA__c = 4.0,
                    Approved_for_Gradution__c = false,
                    Graduation_Date__c = Date.newInstance(2021, 5, 10)
                );
                change = true;
            } else{
                	testS = new Student__c(
                    Name = 'Test Student',
                    Grade_Level__c = '11th',
                    GPA__c = 4.0,
                    Approved_for_Gradution__c = false,
                    Graduation_Date__c = Date.newInstance(2022, 5, 10)
                );
               		change = false;
            }
            tStudents.add(testS);
            i++;
        }
        insert tStudents;
        List<Class__c> tC = new List<Class__c>();
        //Integer i = 0;
        Teacher__c testT = new Teacher__c(
            Name = 'Test Teacher',
            Education__c = 'PH.D'
        );
        insert testT;
        Teacher__c testT2 = new Teacher__c(
            Name = 'Test Teacher',
            Education__c = 'PH.D'
        );
        insert testT2;
        Class__c cTest1 = new Class__c(
            Name = 'Test Class',
            Class_Size__c = 10,
            Teacher__c = testT.Id
        );
        tC.add(cTest1);
        Class__c cTest2 = new Class__c(
            Name = 'Test Class2',
            Class_Size__c = 10,
            Teacher__c = testT.Id
        );
        tC.add(cTest2);
        Class__c cTest3 = new Class__c(
            Name = 'Test Class2',
            Class_Size__c = 10,
            Teacher__c = testT.Id
        );
        tC.add(cTest3);
        insert tC;
        change = true;
        List<Junction_Class__c> jcTest = new List<Junction_Class__c>();
        Junction_Class__c jc = null;
        i = 0;
        //do one class with the loop 
        while(i < 15){
            if(change){
                jc = new Junction_Class__c(
                    Class__c = cTest1.Id,
                    Student__c = tStudents[i].Id
                );
            }else{
                jc = new Junction_Class__c(
                    Class__c = cTest2.Id,
                    Student__c = tStudents[i].Id
                );
            }
            i++;
            change = false;
            jcTest.add(jc);
        }
        insert jcTest;
    }

    @isTest static void delClass(){
        List<Class__c> test = [SELECT Name , Class_Size__c, Class_Count__c FROM Class__c];

        delete test;
    }

}