public inherited sharing class Util {
    private static final Map<String, Schema.SObjectType> GLOBAL_DESCRIBE = Schema.getGlobalDescribe();
    
    private Util() {}

    public static Id getRecordTypeId(String objectName, String recordTypeName) {
        return GLOBAL_DESCRIBE.get(objectName).getDescribe().getRecordTypeInfosByDeveloperName().get(recordTypeName).getRecordTypeId();
    }

    public static String getUUID() {
        Blob cryptoBlob = Crypto.GenerateAESKey(128);
        String externalId = EncodingUtil.ConvertTohex(cryptoBlob);
        externalId = '00Q' + String.valueOf(Datetime.now().getTime()) + externalId.substring(0,18);
        return externalId;
    }

    // This will randomize the conents of any list in-place
    public static void randomize(List<Object> objectList) {
        Integer randomIndex;
        Integer currentIndex = objectList.size();
        while (currentIndex != 0) {
            randomIndex = integer.valueOf(Math.floor(Math.random() * currentIndex));
            currentIndex -= 1;
            Object o = objectList[currentIndex];
            objectList[currentIndex] = objectList[randomIndex];
            objectList[randomIndex] = o;
        }
    }
}
