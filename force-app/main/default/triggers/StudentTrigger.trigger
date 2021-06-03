trigger StudentTrigger on Student__c (before delete) {
    List<Student__c> possibleStudentDelete = Trigger.old;
    //List<Student__c> dS = ApprovesStudent.approveStudentDeletion(possibleStudentDelete);
    ApprovesStudent.approveStudentDeletion(possibleStudentDelete);
    /*if(dS.size() > 0){
        delete dS;
    }
    /*for(Student__c s : possibleStudentDelete){
        s.addError('Cannot Delete');
    }*/
    
}