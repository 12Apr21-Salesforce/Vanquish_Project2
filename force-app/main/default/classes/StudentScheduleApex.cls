public with sharing class StudentScheduleApex {
    @AuraEnabled
    public static List<Student__c> getStudent() {
        
        List<Student__c> s = [SELECT Name, GPA__c, Approved_For_Gradution__c, Grade_Level__c, 
        Graduation_Date__c, Has_Graduated__c,Student_Counselor__r.Name FROM Student__c];
        // strip inaccessable goes hereish
        return s;
    }

    @AuraEnabled
    public static String getToday() {
        
       
        return System.now().format('EEEE');
    }

    @AuraEnabled
    public static Map<String,List<Class__c>> getSchedule(List<String> stu) {
        
        //List<Junction_Class__c> s = [SELECT Name, Class__c, Student__c FROM Junction_Class__c WHERE Student__r.Name in :stu];
        List<Id> classIds = new List<Id>();

       //*
        List<Student__c> s = [ SELECT Id, Name, (SELECT Class__c FROM Junctions__r) FROM Student__c WHERE Name in :stu];

        Map<String,List<Class__c>> m = new Map<String,List<Class__c>>();   

        for (Student__c cSJ : s){

            for(Junction_Class__c jc: cSJ.Junctions__r){
                classIds.add(jc.Class__c);
            }
        }



        // need to  coalate class_c into seperate lists so they are sepreated by students, current version works on one student
        
        //for(List<Class__c> subclasses: ){}
        //List<Class__c> 
        map<Id, Class__c> c = new Map<Id,Class__c >( [ SELECT Id, Name, Campus__c, Address__c, Teacher__c, (SELECT Day__c, Start_Time__c, End_Time__c, Duration__c, Class_Name__c
        FROM Class_Meeting_Times1__r) FROM Class__c WHERE Id IN :classIds ORDER BY Name]);

        
        for(Student__c fred: s){

            List<Class__c> neuc = new List<Class__c>();
            for(Junction_Class__c jc: fred.Junctions__r){

                neuc.add(c.get(jc.Class__c));
            
            } 
            m.put(fred.Name, neuc);

        }
        
        //*/
        // strip inaccessable goes hereish
        return m;
    }
}