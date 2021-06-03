public class ClassHelperMethod {
    
    public static void deleteClass(List<Class__c> cList){
        //List<Task> tClass = new List<Task>();
        //Boolean error = false;
        for(Class__c c : cList){
            if(c.Class_Count__c > 0){
                c.addError('Class still has students connected to class. Please review the students in class.');
            }
        } 
    }

    public static void junctionClassCheck(List<Junction_Class__c> nList){
        for( Junction_Class__c curr : [SELECT Student__r.Name, Class__c FROM Junction_Class__c]){
            for(Junction_Class__c nJcs : nList){
                if(curr.Student__r.Name == nJcs.Student__r.Name){
                    nJcs.addError('Duplicate Students are not allowed. Please review who you are inserting.');
                }
            }
        }
    }
        
}