global class ClassMeetingTimeWrapper implements Comparable{

    public Class_Meeting_Time__c cmt;

    public ClassMeetingTimeWrapper(Class_Meeting_Time__c cmtIn) {
        cmt = cmtIn;
    }

    global integer compareTo(Object compareTo){

        ClassMeetingTimeWrapper cmtCompare = (ClassMeetingTimeWrapper)compareTo;

        if (cmt.Start_Time__c > cmtCompare.cmt.Start_Time__c)
            return 1;
        else if (cmt.Start_Time__c < cmtCompare.cmt.Start_Time__c)
            return -1;
        else {
            return 0;
        }
    }
}