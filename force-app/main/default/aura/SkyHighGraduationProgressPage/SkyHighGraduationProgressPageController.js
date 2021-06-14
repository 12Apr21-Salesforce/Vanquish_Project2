({
    handleSectionToggle : function(cmp, event) {

        // Return a list of open sections
        var openSections = event.getParam('openSections');

        if (openSections.length === 0) {
            cmp.set('v.activeSectionsMessage', "Choose an option to view student progress.");
        }
        else {
            cmp.set('v.activeSectionsMessage', "You are viewing: " + openSections.join(', '));
        }
    },

    init: function (cmp, event, helper) {
        
        cmp.set('v.mycolumns', [
            {label: 'Student Name', fieldName: 'Name', type: 'text'},
            {label: 'Grade Level', fieldName: 'Grade_Level__c', type: 'Picklist'},
            {label: 'GPA', fieldName: 'GPA__c', type: 'Number'},
            //{label: 'Student Counselor', fieldName: 'Student_Counselor__c', type: 'Lookup'}
        ]),

        cmp.set('v.mygradcolumns', [
            {label: 'Student Name', fieldName: 'Name', type: 'text'},
            {label: 'Grade Level', fieldName: 'Grade_Level__c', type: 'Picklist'},
            {label: 'GPA', fieldName: 'GPA__c', type: 'Number'},
            {label: 'Approved for Gradution', fieldName: 'Approved_for_Gradution__c', type: 'checkbox'},

        ]),

        helper.getData(cmp);
        helper.getHonorData(cmp);
        helper.getGradData(cmp);

    }

})