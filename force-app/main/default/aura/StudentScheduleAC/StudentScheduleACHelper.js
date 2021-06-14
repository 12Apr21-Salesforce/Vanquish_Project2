({


    

    get2Day: function(cmp) {
      
        var action = cmp.get('c.getToday');
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
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
        
        var action = cmp.get('c.getStudent');
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                
               
                //*
                for(let x in response.getReturnValue()){
                    //console.log(response.getReturnValue()[x]);

                    if(!response.getReturnValue()[x].Has_Graduated__c){
                        let data2 = {               

                            Name: response.getReturnValue()[x].Name,
                            grade_level: response.getReturnValue()[x].Grade_Level__c,
                            Student_total: response.getReturnValue()[x]
                        }
                        //console.log(data2); ///////
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


    getScheduleData : function(cmp, studentName) {
        

    
        let data = []
        let stuindex;
        let loop_exlusion_counter = true;

        let StudentNames = []
        for(let i in studentName){
                StudentNames.push(
                        studentName[i].Name

                );

        }

    
        // currently retreieves a list of all students with a subquery to get all thier junction classes
        var action = cmp.get('c.getSchedule');
        action.setParams({ stu : StudentNames});

        action.setCallback(this, function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log("ahoy");
                for(let x in response.getReturnValue()){
                    
                        
                        stuindex = StudentNames.indexOf(x);
                        data.push({Name: x,
                                   grade_lvl: studentName[stuindex].Student_total.Grade_Level__c,
                                   GPA: studentName[stuindex].Student_total.GPA__c,
                                   Counselor: studentName[stuindex].Student_total.Student_Counselor__r.Name,
                                   Grad_Approved: studentName[stuindex].Student_total.Approved_for_Gradution__c,
                                   Grad_Date: studentName[stuindex].Student_total.Graduation_Date__c
                        });

                        
                        // this line adds a spacer row to the datatable, ie that empty row between 2 people,
                        // VVV remove this line if you dont like that                        
                        data.push({});
                        

                        
                    
                        // this for loop populates the schedule
                       if(cmp.get('v.class2dayonly')){
                                for(let y in response.getReturnValue()[x] ){

                                    
                                    

                                    if(response.getReturnValue()[x][y].Class_Meeting_Times1__r[0].Day__c == cmp.get('v.Today')){

                                        if(loop_exlusion_counter){
                                            data.push({
                                                GPA: x + "'s Clases", 
                                                Counselor: "for: " + cmp.get('v.Today'),
                                                Grad_Date: "class"
                                                
                                            });
                                        }
                                            loop_exlusion_counter = false;


                                        let junction_classes = {
                                                
                                            Grad_Date: response.getReturnValue()[x][y].Name,
                                            Start: response.getReturnValue()[x][y].Class_Meeting_Times1__r[0].Start_Time__c,                        
                                            End: response.getReturnValue()[x][y].Class_Meeting_Times1__r[0].End_Time__c
                                        }
                                    

                                        data.push(junction_classes);
                                    }

                                    if(loop_exlusion_counter){

                                        data.push({
                                            GPA:"no classes", 
                                            Counselor: "on " + cmp.get('v.Today'),
                                          
                                            
                                        }); 

                                    }
                                    loop_exlusion_counter = false;
                            }
                    }else{
                        for(let y in response.getReturnValue()[x] ){

                            if(loop_exlusion_counter){
                                data.push({
                                    GPA: x + "'s Clases", 
                                    Counselor: "Classes",
                                    Grad_Date: "Day",
                                   
                                });
                            }
                            loop_exlusion_counter = false;
                                
                            let junction_classes = {
                                    
                                Counselor: response.getReturnValue()[x][y].Name,
                                Grad_Date:response.getReturnValue()[x][y].Class_Meeting_Times1__r[0].Day__c, 
                                Start: response.getReturnValue()[x][y].Class_Meeting_Times1__r[0].Start_Time__c,                        
                                End: response.getReturnValue()[x][y].Class_Meeting_Times1__r[0].End_Time__c
                            }

                            data.push(junction_classes);
                        } //end of for loop

                   } // end of else
                      
                      // this line adds a spacer row to the datatable, ie that empty row between 2 people,
                        // VVV remove this line if you dont like that 
                      data.push({});
                      loop_exlusion_counter = true;
                }
                //*/

                // push all of it to the schedule datatable
                cmp.set('v.data2', data);


            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        });
        $A.enqueueAction(action);
    },


})