public class balance {
   //Create a method that will find all Opportunities which have already passed their Close Date 
     //* and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and 
     //* they are not marked as 'Closed Won', they should be marked as 'Closed Lost'.
     public static Boolean questionMarks(String str) {
        Integer cnt = 0; // cretaing a counter to check each '?' in the string
        Integer fNum = 0;
        Integer lNum = 0;
        Boolean fPick = false;
        Boolean lPick = false;
        Boolean allG = false;

          for(Integer i = 0; i < str.length(); i++){ 
            String holder = null;
            if(i+1 == str.length()){
                holder = str.substring(i);
            }else{
                holder = str.substring(i, i+1);
            }
            
            if(holder.isNumeric() && fPick != true){
                fPick = true;
                fNum  = Integer.valueOf(holder);
            }
            else if(holder.isNumeric() && lPick != true){
                lPick = true;
                lNum = Integer.valueOf(holder);
                
            }
            if(holder == '?' && fPick == true){
                cnt = cnt + 1;
            }
            if(fPick == true && lPick == true){
                Integer s = fNum + lNum;
                if(s == 10 && cnt == 3){
                    allG = true;
                    break;
                }else{
                    cnt = 0;
                    fPick = false;
                    lPick =  false;
                    fNum = 0;
                    lNum = 0;
                }
            }
        }
      return allG;
    }
    public static void updateStudentRecords(){
        List<Student__c> sList = [SELECT Parent_First_Name__c, Parent_Last_Name__c, Parent_Email__c FROM Student__c WHERE Parent_First_Name__c = ' ' AND Parent_Last_Name__c = ' ' AND Parent_Email__c = NULL];
        //System.debug(sList);
        for(Student__c s: sList){
           s.Parent_First_Name__c = 'Jayvious';
           s.Parent_Last_Name__c = 'Williams';
           s.Parent_Email__c = 'JayviousWilliams@gmail.com';
        }
         insert sList;
    }
    
}