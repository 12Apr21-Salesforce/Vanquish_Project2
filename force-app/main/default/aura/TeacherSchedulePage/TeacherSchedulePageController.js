({
    //initializes the dataTable with a list of teachers
    doInit : function(cmp, event, helper) {
        helper.doInit(cmp, event)
    },

    //set the weekly schedule recordViewForm based on the selection from the lightning:select
    teacherSelect : function(cmp, event, helper) {
        helper.teacherSelect(cmp, event)
        helper.classRosterSet(cmp, event)
    },

    //changes the student list on selection of class
    rosterSelect : function(cmp, event, helper) {
        helper.rosterSelect(cmp, event)
    },

    //change the daily schedule based on the select drop picklist containing days of the week
    changeDailyList : function(cmp, event, helper) {
        helper.changeDailyList(cmp, event)
    },
})