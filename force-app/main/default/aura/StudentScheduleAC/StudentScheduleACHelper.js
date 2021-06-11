({
    fetchD: function (cmp, Data, numberOfRecords) {
    
        
        cmp.set('v.data', Data);
        
    },

    getStudentData : function(cmp) {

        let data = []
        var action = cmp.get('c.getStudent');
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                
                
                //*
                for(let x in response.getReturnValue()){
                        let data2 = {

                            Name: response.getReturnValue()[x].Name,
                            grade_level: response.getReturnValue()[x].Grade_level__c

                        }
                        data.push(data2);
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


    getScheduleData : function(cmp, studentName) {
        

        console.log("name2 = " + studentName);
        let data = [{
                Name: studentName 
        }]
        var action = cmp.get('c.getSchedule');
        action.setParams({ stu : studentName});
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log("arhoy" + response.getReturnValue());
                //*
                for(let x in response.getReturnValue()){
                        let data2 = {

                            Name: response.getReturnValue()[x].Name,
                            //grade_level: response.getReturnValue()[x].Grade_level__c

                        }
                        data.push(data2);
                }
                //*/
                cmp.set('v.data2', data);


            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        }));
        $A.enqueueAction(action);
    },

    getMultiData : function(cmp, bulkStudents) {

        console.log("alhoy " + bulkStudents.length + " 0 = " + bulkStudents[0].Name );
        
        for(let x in bulkStudents){
            
            This.getScheduleData(cmp, bulkStudents[x].Name);

        }



    }

})
