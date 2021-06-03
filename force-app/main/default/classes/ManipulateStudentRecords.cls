public class ManipulateStudentRecords {
    
    public static void updateEmailRecords(){
        List<Student__c> sList = [SELECT Name, Parent_First_Name__c, Parent_Last_Name__c, Parent_Email__c FROM Student__c WHERE Parent_First_Name__c = NULL AND Parent_Last_Name__c = NULL AND Parent_Email__c = NULL];
        
        for(Student__c s: sList){
           s.Parent_First_Name__c = 'Jayvious';
           Integer h = s.Name.indexOf(' ');
           s.Parent_Last_Name__c = s.Name.substring(h);
           s.Parent_Email__c = 'JayviousWilliams@gmail.com';
        }
        update sList;
    }
    
    public static List<Student__c> approveStudentDeletion(List<Student__c> sList){
        List<Student__c> approvedForD = new List<Student__c>();
        for(Student__c s : sList ){
            if(s.Grade_Level__c == '12th'){
                if(s.Approved_for_Gradution__c == true){
                    if(s.Graduation_Date__c < Date.today()){
                    approvedForD.add(s);
                    }
                }
            }
            else if(s.Behavior__c == 'Expelled'){
                approvedForD.add(s);
            }
            else{
                s.addError('This Student is not allowed to be deleted.');
            }
        }
        return approvedForD;
    }
}