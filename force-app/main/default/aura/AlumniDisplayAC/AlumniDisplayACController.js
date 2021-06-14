({
    init: function (cmp, event, helper) {
        cmp.set('v.columns', [
            {label: 'Student', fieldName: 'Name', type: 'Student__c'},
            {label: 'GPA', fieldName: 'GPA', type: 'text'},
            {label: 'Graduation Date', fieldName: 'Grad_Date', type: 'text'},
        ]);
        
        
        
       

        helper.getStudentData(cmp);
    
    },

})