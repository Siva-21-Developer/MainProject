public class geoloc {
    public geoloc() {

    }
    @AuraEnabled
    public static integer testvalue()
    {
        List<Account> accdata = [select Id from Account];
        return accdata.size();
        
    }
}