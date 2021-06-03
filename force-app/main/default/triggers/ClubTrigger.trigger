trigger ClubTrigger on Club__c (before delete) {

    if(Trigger.isBefore){
        if(Trigger.isDelete){
            List<Club__c> c = Trigger.old;
            ClubHelperMethods.deleteClub(c);
        }
    }
    

}