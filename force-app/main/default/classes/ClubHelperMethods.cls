public class ClubHelperMethods {
    public static void deleteClub(List<Club__c> cList){
        //List<Task> tClass = new List<Task> tClass;
        for(Club__c c : cList){
            if(c.Club_Count__c > 0){
                c.addError('Club still has students connected to class. Please review the students in class.');
            }
        } 
    }
}