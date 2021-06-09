({
    handleSectionToggle : function(cmp, event) {

        // Return a list of open sections
        var openSections = event.getParam('openSections');

        if (openSections.length === 0) {
            cmp.set('v.activeSectionsMessage', "Choose an option to view student progress.");
        }
        else {
            cmp.set('v.activeSectionsMessage', "You are viewing: " + openSections.join(', '));
        }
    }
})