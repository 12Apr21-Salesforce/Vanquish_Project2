@isTest
public class StudentsVsClubsTest {
  
    @isTest static void studentsClubsTest() {
        Student__c stuInfo = new Student__C(Name='Mary', GPA__c=3.49, Grade_Level__c='11th');
        insert stuInfo;
        Club__c clubInfo= new Club__c(Name='DECA', Club_size__c=200);
        insert clubInfo;
        
        List<Student__c> stuList = [select id, Name from Student__c where Name='Mary'];
        List<Club__c> clubList = [select id, Name from Club__c where Name='DECA'];

        Junction_Club__c jClub = new Junction_Club__c(student__c=stuList[0].id, club__c=clubList[0].id);
        insert jClub;

        Test.startTest();
        List<Junction_Club__c> jStudentClub = StudentsVsClubs.fetchStudentsClubs();
        Test.stopTest();
        
        System.assertEquals('Mary',jStudentClub[0].Student__r.Name, 'Student value mathces');
        System.assertEquals('DECA',jStudentClub[0].Club__r.Name, 'Club value mathces');

    }
}
