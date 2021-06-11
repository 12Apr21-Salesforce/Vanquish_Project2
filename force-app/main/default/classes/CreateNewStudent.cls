public with sharing class CreateNewStudent {
    @AuraEnabled
    public static List<String> getPickList(String stdObject, String gradeLevel) {
        List<String> pkList = new List<String>();
        Map<String, Schema.SObjectType> allObj = Schema.getGlobalDescribe();
        Map<String, Schema.SObjectField> allFlds = allObj.get(stdObject).getDescribe().fields.getMap();
        List<Schema.PicklistEntry> pickList = allFlds.get(gradeLevel).getDescribe().getPickListValues();
        for(Schema.PicklistEntry pk : pickList){
            pkList.add(pk.getValue());
        }
        return pkList;
    }
    @AuraEnabled
    public static Student__c createStudent(Student__c std){
        insert std;
        return std;
    }
}