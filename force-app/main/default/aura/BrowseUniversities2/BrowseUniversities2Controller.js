({
    handleSectionToggle : function(cmp, event) {

        // Return a list of open sections
        var openSections = event.getParam('openSections');

        if (openSections.length === 0) {
            cmp.set('v.activeSectionsMessage', "Choose an option to browse Universities.");
        }
        else {
            cmp.set('v.activeSectionsMessage', "You are viewing: " + openSections.join(', '));
        }
    },

    init: function (cmp, event, helper) {
        
        cmp.set('v.mycolumns', [
            {label: 'University Name', fieldName: 'Name', type: 'text'},
            {label: 'Honor Roll Required?', fieldName: 'Honor_Roll_Required__c', type: 'Checkbox'},
            {label: 'Required GPA', fieldName: 'GPA_Required__c', type: 'Number'},
            {label: 'City', fieldName: 'City_Name__c', type: 'Text'},
            {label: 'State', fieldName: 'State__c', type: 'Text'},
        ]),
    
        helper.getData(cmp);
        helper.getHonorData(cmp);

    }

})