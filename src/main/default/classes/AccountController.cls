public with sharing class AccountController {
    @AuraEnabled
    public static String getRecordName(Id accountId) {
        Account[] accounts = [SELECT Id, Name FROM Account WHERE Id = :accountId];
        Account myAccount = accounts[0];
        return myAccount.Name;
    }
}
