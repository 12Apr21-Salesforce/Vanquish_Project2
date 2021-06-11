({
    //initializes the list of teachers in the datatable at the top of the page
    doInit : function(component) {
        let teachers = component.get("c.getTeachers")

        teachers.setCallback(this, $A.getCallback(function(response){
            if(response.getState() === "SUCCESS") {
                component.set("v.teachers", response.getReturnValue())
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        }))
        $A.enqueueAction(teachers)
    },

    //used to set the weekly schedule recordViewForm based on the selection from the lightning:select 
    handleSelect: function(component, event) {
        let classList = component.get("c.getWeeklyMeetingTimes")

        component.set("v.showAndTell", true) //this line enables the aura:if functionality
        component.set("v.currentTeacher", event.getParam("selectedRows")[0]) //this line sets the currentTeacher for reference in header in the aura:if

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

    //used to change the daily schedule based on the select drop picklist containing days of the week
    changeDailyList: function(component, event) {
        let dailyList = component.get("c.getTodayMeetingTimes") 

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

})