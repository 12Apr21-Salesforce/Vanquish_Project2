({
    init: function (cmp, event, helper) {
        cmp.set('v.columns', [
            {label: 'Student', fieldName: 'Name', type: 'Student__c'},
            {label: 'Grade Level', fieldName: 'grade_level', type: 'text'}, 
        ]);
        
        cmp.set('v.columns2', [
            {label: 'Student', fieldName: 'Name', type: 'Student__c'},
            {label: 'insert filed here', fieldName: 'grade_level', type: 'text'}, 
        ]);
        
       

        //helper.fetchD(cmp, data, 10);
        helper.getStudentData(cmp);
    
    },

    addListView: function (cmp, event, helper) {
        var selectedRows = event.getParam('selectedRows');
        
        //console.log("ahoy " + selectedRows[0].Name)
        //cmp.set('v.data2', selectedRows);
        
        //helper.getScheduleData(cmp,selectedRows[0].Name);
        helper.getMultiData(cmp,selectedRows);
        
    }
  
})

