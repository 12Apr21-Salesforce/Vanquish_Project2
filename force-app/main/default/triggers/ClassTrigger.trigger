trigger ClassTrigger on Class__c (before delete) {
    if(Trigger.isBefore){
        if(Trigger.isDelete){
            List<Class__c> c = Trigger.old;
            ClassHelperMethod.deleteClass(c);
        }
    }

}