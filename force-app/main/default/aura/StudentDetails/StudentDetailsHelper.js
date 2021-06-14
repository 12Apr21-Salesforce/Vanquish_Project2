({
	handleShowDetails : function(component, event) {
		component.set("v.student", event.getParam("student"))
        component.set("v.club", event.getParam("club"))
        component.set("v.showForm", true)
	},
    

})