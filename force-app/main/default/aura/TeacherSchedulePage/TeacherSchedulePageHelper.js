({
    //initializes the list of teachers in the datatable at the top of the page, and sets the class list for later reference
    doInit : function(component, event) {
        var teachers = component.get("c.getTeachers")

        teachers.setCallback(this, function(response){
            if(response.getState() === "SUCCESS") {
                component.set("v.teachers", response.getReturnValue())
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        })

        $A.enqueueAction(teachers)
    },

    //used to set the weekly schedule recordViewForm based on the selection from the lightning:select 
    teacherSelect: function(component, event) {
        component.set("v.showAndTell", true) //this line enables the aura:if functionality on first selection of a teacher
        component.set("v.currentTeacher", event.getParam("selectedRows")[0]) //this line sets the current teacher to display above the schedule

        var classList = component.get("c.getWeeklyMeetingTimes")

        classList.setParams({tea: event.getParam("selectedRows")[0]}) 

        classList.setCallback(this, function(response){
            if(response.getState() === "SUCCESS") {
                component.set("v.classes", response.getReturnValue())
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        })

        $A.enqueueAction(classList)
    },

    handleEmail: function(component, event) {
        component.set("v.toggleEmail", true) 
    },

    hideEmail: function(component, event) {
        component.set("v.toggleEmail", false)
    },

    //sets the list of classes to display for selection, that don't repeat due to multiple class times
    classRosterSet: function(component, event) {
        var roster = component.get("c.getRoster")

        roster.setParams({tea: event.getParam("selectedRows")[0]}) 

        roster.setCallback(this, function(response){
            if(response.getState() === "SUCCESS") {
                component.set("v.classRoster", response.getReturnValue())
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        })

        $A.enqueueAction(roster)
    },

    //used to change the daily schedule based on the select drop picklist containing days of the week
    changeDailyList: function(component, event) {
        var dailyList = component.get("c.getTodayMeetingTimes") 

        dailyList.setParams({tea: component.find('teacherTable').getSelectedRows()[0],
                            day: component.find('selectDay').get("v.value")})

        dailyList.setCallback(this, function(response){
            if(response.getState() === "SUCCESS") {
                component.set("v.daily", response.getReturnValue())
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        })

        $A.enqueueAction(dailyList)
    },

    //sets current class selected, and updates list of students in class
    rosterSelect: function(component, event) {
        component.set("v.currentClass", event.getParam("selectedRows")[0]) //this line sets the current class to display

        var classes = component.get("c.getStudents")

        classes.setParams({cla: event.getParam("selectedRows")[0]}) 

        classes.setCallback(this, function(response){
            if(response.getState() === "SUCCESS") {
                component.set("v.students", response.getReturnValue())
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        })

        $A.enqueueAction(classes)
    },
})