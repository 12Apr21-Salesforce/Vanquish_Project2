({
    init: function (cmp, event, helper) {
        cmp.set('v.columns', [
            {label: 'Student', fieldName: 'Name', type: 'Student__c'},
            {label: 'Grade Level', fieldName: 'grade_level', type: 'text'},
             
        ]);
        
        cmp.set('v.columns2', [
            {label: 'Student', fieldName: 'Name', type: 'Student__c'},
            //* //labels for the student info fields
            {label: 'Grade Level', fieldName: 'grade_lvl', type: 'text'},
            {label: 'Approved For Graduation', fieldName: 'Grad_Approved', type: 'boolean'}, 
            {label: 'GPA', fieldName: 'GPA', type: 'text'},  
            {label: 'Student Counselor', fieldName: 'Counselor', type: 'text'}, 
            {label: 'Graduation Date', fieldName: 'Grad_Date', type: 'text'},
            {fieldName: 'Start', type: 'date', typeAttributes: {hour: "2-digit" , minute: "2-digit"} },
            {fieldName: 'End', type: 'date', typeAttributes: {hour: "2-digit" , minute: "2-digit"} },
            /*
            , typeAttributes: {weekday: "long",
            year: "numeric",
            month: "long",
            day: "2-digit"}},
              // Remove date field for final release just for error processing
            //*/
        ]);
        
       

        //helper.fetchD(cmp, data, 10);
        helper.get2Day(cmp);
        helper.getStudentData(cmp);
    
    },

    addListView: function (cmp, event, helper) {
        var selectedRows = event.getParam('selectedRows');
        
        //console.log("ahoy " + selectedRows[0].Name)
        //cmp.set('v.data2', selectedRows);
        
        if(selectedRows.length > 0){

        helper.getScheduleData(cmp, selectedRows);
        
        }
    },

    handleClick: function(cmp, event, helper) {

        var selectedRows = cmp.find("datable").getSelectedRows();
        cmp.set('v.class2dayonly', !cmp.get('v.class2dayonly'));
        helper.getScheduleData(cmp, selectedRows);
        


    }

  
})