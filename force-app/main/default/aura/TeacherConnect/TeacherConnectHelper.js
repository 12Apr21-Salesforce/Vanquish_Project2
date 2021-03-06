({
    doInit : function(cmp, event) {
        var teachers = cmp.get("c.getTeachers")

        teachers.setCallback(this, function(response){
            if(response.getState() === "SUCCESS") {
                cmp.set("v.selectedValue", response.getReturnValue())
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        })

        $A.enqueueAction(teachers)
    },

    sendHelper: function(component, getEmail, getSubject, getbody) {
        // call the server side controller method 	
        var action = component.get("c.sendMailMethod");
        // set the 3 params to sendMailMethod method   
        action.setParams({
            'mMail': getEmail,
            'mSubject': getSubject,
            'mbody': getbody
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
                // if state of server response is comes "SUCCESS",
                // display the success message box by set mailStatus attribute to true
                component.set("v.mailStatus", true);
            }
 
        });
        $A.enqueueAction(action);
    },

})