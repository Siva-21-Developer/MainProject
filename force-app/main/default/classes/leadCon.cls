public with sharing class leadCon {
    public leadCon() {

    }

    public static void convert(List<Lead> LeadData)
    {
        List<Database.LeadConvert> led = new List<Database.LeadConvert>();
        for(lead data : LeadData)
        {
            Database.LeadConvert lc = new database.LeadConvert();
            lc.setLeadId(data.Id);
            lc.setConvertedStatus('Closed - Converted');
            led.add(lc);
        }
        Database.convertLead(led);

        
        // Database.LeadConvert lc = new database.LeadConvert();
        // lc.setLeadId(myLead.id);

        // LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
        // lc.setConvertedStatus(convertStatus.MasterLabel);

        // Database.LeadConvertResult lcr = Database.convertLead(lc);
        // System.assert(lcr.isSuccess());
    }
}