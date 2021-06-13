({
    getData : function(cmp){

        var action = cmp.get('c.getUniversities');

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

    handleActive: function (cmp, event) {
        var tab = event.getSource();
        switch (tab.get('v.id')) {
            case 'allUniv' :
                this.injectComponent('c.universities', tab);
                break;
            case 'honor' :
                this.injectComponent('c.honor', tab);
                break;
        }
    },

    injectComponent: function (name, target) {
        $A.createComponent(name, {
            // no attrs
        }, function (contentComponent, status, error) {
            if (status === "SUCCESS") {
                target.set('v.body', contentComponent);
            } else {
                throw new Error(error);
            }
        });
    }

})