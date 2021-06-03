@isTest
 private class JunctionClassTest{

    @TestSetup
    static void makeData(){
        List<Student__c> tStudents = new List<Student__c>();
        List<Class__c> tClass = new List<Class__c>();
        Integer i = 0;
        Boolean change = false;
        Student__c testS = null;
        //populate parent fields outside of my control flow
        while(i < 10){
            if(!change){
                 	testS = new Student__c(
                    Name = 'Test ' + i,
                    Grade_Level__c = '10th',
                    GPA__c = 4.0,
                    Approved_for_Gradution__c = false,
                    Graduation_Date__c = Date.newInstance(2021, 5, 10)
                );
                change = true;
            } else{
                	testS = new Student__c(
                    Name = 'Test ' + i,
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
        i = 0;
        change = false;
        Teacher__c testT = new Teacher__c(
            Name = 'Test Teacher',
            Education__c = 'PH.D'
        );
        insert testT;
        Class__c cTest1 = null;
        while(i < 1){
            if(change){
                cTest1 = new Class__c(
                    Name = 'Test Class ' + i,
                    Class_Size__c = 10,
                    Teacher__c = testT.Id
                );
            } else{
                cTest1 = new Class__c(
                    Name = 'Test Class ' + i,
                    Class_Size__c = 15,
                    Teacher__c = testT.Id
                );
            }
            tClass.add(cTest1);
        }
        insert tClass;
        List<Junction_Class__c> nList = new List<Junction_Class__c>();
        Junction_Class__c nJc = null;
        i = 0;
        for(Integer j = 0; j < tStudents.size(); j++){
            if(Math.mod(j, 2) == 0){
                nJc = new Junction_Class__c(
                    Class__c = tClass[0].Id,
                    Student__c = tStudents[j].Id
                );
            } else{
                nJc = new Junction_Class__c(
                    Class__c = tClass[1].Id,
                    Student__c = tStudents[j].Id
                );
            }
            nList.add(nJc);
        }
        insert nList;
    }

    @isTest static void dupsNoDups(){
        List<Class__c> tClass = [SELECT Name FROM Class__c];
        Student__c test = new Student__c(
            Name = 'Test ' + 3,
            Grade_Level__c = '11th',
            GPA__c = 4.0,
            Approved_for_Gradution__c = false,
            Graduation_Date__c = Date.newInstance(2021, 5, 10)
        );

        insert test;
        Junction_Class__c nJc = new Junction_Class__c(
            Student__c = test.Id,
            Class__c = tClass[1].Id
        );
        insert nJc;
    }

}