trigger JunctionClassTrigger on Junction_Class__c (before insert) {
    List<Junction_Class__c> newJCs = Trigger.new;
    ClassHelperMethod.junctionClassCheck(newJCs);
}