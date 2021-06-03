public class StudentScheduleLinksExtension {

    List<Student__c> students;

    /*
    public PageReference linkToSchedule(){
        PageReference scheduleLink = new PageReference('/apex/StudentSchedule?id=' + student.Id);
        return scheduleLink;
    }
    */

    public List<PageReference> linkToSchedule(){

        List<PageReference> linksList = new List<PageReference>();

        for (Student__c s : students){
            PageReference newRef = new PageReference('/apex/StudentSchedule?id=' + s.Id);
            linksList.add(newRef);
        }

        return linksList;
    }



    public StudentScheduleLinksExtension(ApexPages.StandardSetController studentStandardController) {
        this.students = (List<Student__c>)studentStandardController.getRecords();
    }
}