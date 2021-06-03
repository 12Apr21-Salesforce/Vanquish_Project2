public class DOWm {

    public static Map<String, Integer> getDowNumMap(){
        Map<String, Integer> dowNum = new Map<String,Integer>();
        dowNum.put('Monday', 0);
        dowNum.put('Tuesday', 1);
        dowNum.put('Wednesday', 2);
        dowNum.put('Thursday', 3);
        dowNum.put('Friday', 4);

        return dowNum;
    }

    public static Map<Integer, String> getDowMap(){
        Map<Integer, String> dowMap = new Map<Integer, String>();
        dowMap.put(0, 'Monday');
        dowMap.put(1, 'Tuesday');
        dowMap.put(2, 'Wednesday');
        dowMap.put(3, 'Thursday');
        dowMap.put(4, 'Friday');

        return dowMap;
    }
}