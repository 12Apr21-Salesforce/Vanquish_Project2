({

    fetchStudentHelper : function(component, event, helper) {
        component.set('v.columns', [
           // {label: 'Student ID', fieldName: 'Student__c', type: 'text'},
           // {label: 'Clud ID', fieldName: 'Club__c', type: 'text'},
            {label: 'Student Name', fieldName: 'StudentName', type: 'text'},
            {label: 'GPA', fieldName: 'StudentGPA', type: 'Number'},
            {label: 'Grade', fieldName: 'StudentGrade', type: 'text'},
           
            {label: 'Club Name', fieldName: 'ClubName', type: 'text '},
            {label: 'Club Size', fieldName: 'ClubSize', type: 'Number '},
        ]);
           
        var action = component.get("c.fetchStudentsClubs");
        action.setParams({          });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var rows = response.getReturnValue();
                
                for (var i = 0; i < rows.length; i++) {
                    var row = rows[i];
                    console.log(row);
                    // checking if any student related data in row
                    if (row.Student__c) {
                        row.StudentName = row.Student__r.Name;
                        row.StudentGPA = row.Student__r.GPA__c;
                        row.StudentGrade = row.Student__r.Grade_Level__c;
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
