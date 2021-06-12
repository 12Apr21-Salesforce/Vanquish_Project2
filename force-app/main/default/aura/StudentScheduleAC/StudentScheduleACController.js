({
    init: function (cmp, event, helper) {
        cmp.set('v.columns', [
            {label: 'Student', fieldName: 'Name', type: 'Student__c'},
            {label: 'Grade Level', fieldName: 'grade_level', type: 'text'},
            //{fieldName: 'Student_total', type: 'Object'} 
        ]);
        
        cmp.set('v.columns2', [
            {label: 'Student', fieldName: 'Name', type: 'Student__c'},
            //* //labels for the student info fields
            {label: 'Grade Level', fieldName: 'grade_lvl', type: 'text'},
            {label: 'GPA', fieldName: 'GPA', type: 'text'},  
            {label: 'Student Counselor', fieldName: 'Counselor', type: 'text'}, 
            {label: 'Approved For Graduation', fieldName: 'Grad_Approved', type: 'text'}, 
            {label: 'Graduation Date', fieldName: 'Grad_Date', type: 'text'},
            {label: 'Date', fieldName: 'Date', type: 'date', typeAttributes: {weekday: "long",
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
        
        //helper.getMultiData(cmp,selectedRows);
        }else{


            cmp.set('v.data2', []);
        }
    }


   
})
