({

    fetchStudentHelper : function(component, event, helper) {
        component.set('v.columns', [
            {label: 'Junction Name', fieldName: 'JunctionId', type: 'url', 
                typeAttributes: {label: {fieldName: 'Name'}} },
            {label: 'Student Name', fieldName: 'StudentId', type: 'url', 
                typeAttributes: {label: {fieldName: 'StudentName'}} },
            {label: 'GPA', fieldName: 'StudentGPA', type: 'number'},
            {label: 'Grade', fieldName: 'StudentGrade', type: 'text'},         
            {label: 'Club Name', fieldName: 'ClubId', type: 'url',
                typeAttributes: {label: {fieldName: 'ClubName'}} },
            {label: 'Club Size', fieldName: 'ClubSize', type: 'number'},
        ]);
           
        var action = component.get("c.fetchStudentsClubs");
        action.setParams({          });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var rows = response.getReturnValue();
                
                for (let i = 0; i < rows.length; i++) {
                    let row = rows[i];
                    // checking if any student related data in row
                    if (row.Student__c) {
                        row.JunctionId = '/'+row.Id;
                        row.StudentId = '/'+row.Student__r.Id;
                        row.StudentName = row.Student__r.Name;
                        row.StudentGPA = row.Student__r.GPA__c;
                        row.StudentGrade = row.Student__r.Grade_Level__c;
                        row.ClubId = '/'+row.Club__r.Id;
                        row.ClubName = row.Club__r.Name;
                        row.ClubSize = row.Club__r.Club_Size__c;
                    }
                }
                component.set("v.students", rows);
            }
        });
        $A.enqueueAction(action);
    },
})
