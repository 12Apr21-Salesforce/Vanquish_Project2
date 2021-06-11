({

    doInit : function(component) {
        let teachers = component.get("c.getTeachers")

        teachers.setCallback(this, function(response){
            if(response.getState() === "SUCCESS") {
                component.set("v.teachers", response.getReturnValue())
            }
        })
        $A.enqueueAction(teachers)
    },

    showScheduleButton : function(component) {
        component.set("v.showScheduleButton", true)
    },

    // handleMenuSelect: function(cmp, event, helper) {
    //     var selectedMenuItemValue = event.getParam("value");
    // },

    fireShowSchedule: function(component) {
        var menuSelectEvent = $A.get("e.c:TeacherAuraEvent")

        menuSelectEvent.setParams({
            "teacherName" : component.find("teacherTable").get(v.value)
        })

        menuSelectEvent.fire()
    }
<<<<<<< HEAD

})
=======
})
>>>>>>> origin/main
