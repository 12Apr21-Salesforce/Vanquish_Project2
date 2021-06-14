({
    getStudentData : function(cmp) {

        let data = []
     
        var action = cmp.get('c.getStudent');
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                
               
                //*
                for(let x in response.getReturnValue()){
                    
                    if(response.getReturnValue()[x].Has_Graduated__c){
                        
                        let data2 = {

                            Name: response.getReturnValue()[x].Name,
                            GPA: response.getReturnValue()[x].GPA__c,
                            Grad_Date: response.getReturnValue()[x].Graduation_Date__c
                        }
                        data.push(data2);
                    }
                }
                //*/
                cmp.set('v.data', data);
                
                

            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        }));
        $A.enqueueAction(action);
        
    },
})