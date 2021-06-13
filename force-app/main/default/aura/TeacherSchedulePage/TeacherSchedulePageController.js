({
    //initializes the dataTable with a list of teachers
    doInit : function(cmp, event, helper) {
        helper.doInit(cmp)
    },

    //used to set the weekly schedule recordViewForm based on the selection from the lightning:select
    handleSelect : function(cmp, event, helper) {
        helper.handleSelect(cmp, event)
    },

    //used to change the daily schedule based on the select drop picklist containing days of the week
    changeDailyList : function(cmp, event, helper) {
        helper.changeDailyList(cmp, event)
    }
})