({
    get2Day: function(cmp) {
      
        var action = cmp.get('c.getToday');
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                //console.log("today is " + response.getReturnValue());
                cmp.set('v.Today', response.getReturnValue());

            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        }));
        $A.enqueueAction(action);


    },

    getStudentData : function(cmp) {

        let data = []
        let sdh_con = []
        var action = cmp.get('c.getStudent');
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                
                
                //*
                for(let x in response.getReturnValue()){
                        let data2 = {

                            Name: response.getReturnValue()[x].Name,
                            grade_level: response.getReturnValue()[x].Grade_level__c,
                            Student_total: response.getReturnValue()[x]
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
        

        //console.log("name2 = " + studentName);
        let data = []
        let stuindex;

        let StudentNames = []
        for(let i in studentName){
                StudentNames.push(
                        studentName[i].Name

                );

        }

        //console.log("names = " + StudentNames);

        // currently retreieves a list of all students with a subquery to get all thier junction classes
        var action = cmp.get('c.getSchedule');
        action.setParams({ stu : StudentNames});

        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                
                //console.log("arhoy" + response.getReturnValue());
                for(let x in response.getReturnValue()){
                    
                        
                        stuindex = StudentNames.indexOf(x);
                      
                        //console.log("n: " + studentName[stuindex].Student_total.Name + " g: " + studentName[stuindex].Student_total.GPA__c)
                        // this push gives us the name above the schedule
                        // use the string x returned to find the corresponding student in studentName, which is selectedrows, 
                        // the use that student info to fill in the student sector
                        data.push({Name: x,
                                   grade_lvl: studentName[stuindex].Student_total.Grade_Level__c,
                                   GPA: studentName[stuindex].Student_total.GPA__c,
                                   counselor: studentName[stuindex].Student_total.Student_Counselor__c,
                                   Grad_Approved: studentName[stuindex].Student_total.Approved_For_Gradution__c,
                                   Grad_Date: studentName[stuindex].Student_total.Graduation_Date__c
                        });
                        // push in a spacer x-axis for the schedule
                        data.push({
                                Name: "Classes",
                                grade_lvl: "Day",
                                GPA:"Start Time",
                                Counselor: "End Time"
                        });
                    
                        // this for loop populates the schedule

                       
                        for(let y in response.getReturnValue()[x] ){

                            console.log(response.getReturnValue()[x][y].Class_Meeting_Times1__r[0]);
                        let junction_classes = {
                                
                            Name: response.getReturnValue()[x][y].Name,
                            grade_lvl:response.getReturnValue()[x][y].Class_Meeting_Times1__r[0].Day__c, 
                            GPA:response.getReturnValue()[x][y].Class_Meeting_Times1__r[0].Start_Time__c,
                            Counselor: response.getReturnValue()[x][y].Class_Meeting_Times1__r[0].End_Time__c,                        
                            Date: response.getReturnValue()[x][y].Class_Meeting_Times1__r[0].End_Time__c
                        }

                        data.push(junction_classes);
                      }
                    
                }
                //*/

                // push all of it to the schedule datatable
                cmp.set('v.data2', data);


            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        }));
        $A.enqueueAction(action);
    },

    getMultiData : function(cmp, bulkStudents) {

        //console.log("alhoy " + bulkStudents.length + " 0 = " + bulkStudents[0].Name );
        
        for(let x in bulkStudents){
            
            this.getScheduleData(cmp, bulkStudents[x].Name);

        }



    }

})
