public with sharing class LightTest {
    public LightTest() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Account> methodName(){
        try {
            return [
            SELECT Name, AnnualRevenue, Industry
            FROM Account
            WITH SECURITY_ENFORCED
            ORDER BY Name
        ];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static Integer getAccountCount() {
        return [SELECT COUNT() FROM Project__c];
    }

    @AuraEnabled(cacheable=true)
    public static Integer ClientCount() {
        return [SELECT COUNT() FROM Account WHERE RecordTypeId = '012F9000000VDjJIAW'];
    }
}