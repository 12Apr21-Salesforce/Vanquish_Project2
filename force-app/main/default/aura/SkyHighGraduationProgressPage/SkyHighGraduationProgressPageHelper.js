({
    getData : function(cmp){

        var action = cmp.get('c.getStudents');

        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set('v.mydata', response.getReturnValue());
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        }));

        $A.enqueueAction(action);
    },

    getHonorData : function(cmp){

        var action = cmp.get('c.getHonorRoll');

        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log(response.getReturnValue());
                cmp.set('v.myhonordata', response.getReturnValue());
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        }));

        $A.enqueueAction(action);
    },

    getGradData : function(cmp){

        var action = cmp.get('c.getGrads');

        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log(response.getReturnValue());
                cmp.set('v.mygraddata', response.getReturnValue());
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        }));

        $A.enqueueAction(action);
    }

    
})