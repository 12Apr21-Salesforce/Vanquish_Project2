public with sharing class CounselorExtension {
    private final Student__c Counselor;

    public CounselorExtension(ApexPages.StandardSetController stdController) {
        this.Counselor = (Student__c)stdController.getRecord();
    }
    public String getCounselor(){
        return Counselor.name;
    }
}