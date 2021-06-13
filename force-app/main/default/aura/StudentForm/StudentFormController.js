({

    resetForm: function(cmp, event,helper) {
        cmp.find('field').forEach(function(f) {
            f.reset();
        });
    
} ,
/*
    doInit : function(component, event, helper){
        var action = component.get('c.getPickList');
        action.setParams({
            stdObject : component.get('v.stdObject'), 
            gradeLevel : component.get('v.gradeLevel')
        });
        action.setCallback(this,function(result){
            var resultValue = result.getReturnValue();
            component.set('v.gradeList', resultValue);
        });
        $A.enqueueAction(action);
    },
*/
})