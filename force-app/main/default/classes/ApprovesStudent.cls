public class ApprovesStudent { 
    public static void approveStudentDeletion(List<Student__c> sList){
        //List<Student__c> approvedForD = new List<Student__c>();
        for(Student__c s : sList ){
            if(s.Grade_Level__c == '12th'){
                if(!s.Approved_for_Gradution__c && s.Graduation_Date__c < Date.today()){
                    s.addError('Student is not allowed to be deleted');
                }
               //approvedForD.add(s);
            }
            else if(s.Behavior__c != 'Expelled'){
                s.addError('Student is not allowed to be deleted');
            }
        }
    }
}