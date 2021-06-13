({
    handleActive: function (cmp, event, helper) {
        helper.handleActive(cmp, event);
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