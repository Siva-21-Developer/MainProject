public class Project_Reuest_cls 
{
    public static void main(List<Project_Request__c> ProjectRequest)
    {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage(); // Create Mail Object.
        projectsendmail__c email_data = projectsendmail__c.getInstance(); // Get Sales Admin email from custome settings.
        EmailTemplate email_id = [SELECT Id, Subject, Body FROM EmailTemplate WHERE Name = 'project']; // Get email Template Id.
        List<Messaging.SingleEmailMessage> mailsent = new List<Messaging.SingleEmailMessage>(); // Store the Mail.
        
        
        for (Project_Request__c Project_Data : ProjectRequest) // Asign the new data in for loop 
        {
             mail.setTemplateId(email_id.Id); // Email Templeat Id.
             mail.setToAddresses(new String[]{email_data.Email__c}); // To address -- Sales Admin email.
             mail.setTargetObjectId(Project_Data.Client__c); // Id of the contact, lead.
             mail.setWhatId(Project_Data.id); // Id of the record. 
             mail.setSaveAsActivity(false); //
             mail.setUseSignature(false); //
        	 mailsent.add(mail); // Add the mail to List..              
        }

        Messaging.sendEmail(mailsent); // Mail sent statement
    }

    public static void accessRule(List<Project_and_user_association__c> projectUserData)
    {
        List<Project__share> shareRecords = new List<Project__share>();
    
        for(Project_and_user_association__c record : projectUserData)
        {
            Project__share newShare = new Project__share();
            newShare.ParentId = record.Project__c;
            newShare.UserOrGroupId = record.User__c;
            newShare.AccessLevel = record.Status__c;
            newShare.RowCause = Schema.Project__share.RowCause.Manual;
            shareRecords.add(newShare);
        }
        insert shareRecords;
    }
    

    public static String strValueOf(Id convertValue)
    {
        return String.valueOf(convertValue);
           
    }

    public static void accRuleUpdate(List<Project_and_user_association__c> projectUserData)
    {

        Set<Id> parent_id = new Set<id>();
        Set<Id> user_id = new Set<id>();

        for(Project_and_user_association__c userupdata : projectUserData )
        {
            parent_id.add(userupdata.Project__c);
            user_id.add(userupdata.User__c);
        }


        list<project__share> share_rull = [SELECT Id, accesslevel, ParentId, RowCause, UserOrGroupId
        FROM Project__Share
        WHERE ParentId =: parent_id AND UserOrGroupId =: user_id];

        for(Project_and_user_association__c newData : projectUserData)
        {
            Project__Share updateData = new Project__Share();
            updateData.Id = share_rull[0].Id;
            updateData.AccessLevel = newData.Status__c;
            update updateData;
        }

    }

    public static void maxString()
    {
        List<String> minmax = new List<String>{'helloworld', 'welcome', 'way', 'enter','maximumnumber', 'asusvivobookflip'};
        String maxString = minmax[0];
        String minString = minmax[0];
        for (String str : minmax) {
			if(str.length() > maxString.length())
            {
                maxString = str;
            }
            
            if(str.length() < minString.length())
            {
                minString = str;
			}
        }
        
        System.debug('Maximum String: ' + maxString +' : '+ maxString.length());
        System.debug('Minimum String: ' + minString+' : '+minString.length());
        
    }

    
   public static boolean manualShareRead(List<Project_and_user_association__c> projectUserData){
    // Create new sharing object for the custom object Job.
    Project__Share jobShr  = new Project__Share();
 
    // Set the ID of record being shared.
    jobShr.ParentId = projectUserData[0].Project__c;
      
    // Set the ID of user or group being granted access.
    jobShr.UserOrGroupId = projectUserData[0].User__c;
      
    // Set the access level.
    jobShr.AccessLevel = projectUserData[0].Status__c;
      
    // Set rowCause to 'manual' for manual sharing.
    // This line can be omitted as 'manual' is the default value for sharing objects.
    jobShr.RowCause = Schema.Project__Share.RowCause.Manual;
      
    // Insert the sharing record and capture the save result. 
    // The false parameter allows for partial processing if multiple records passed 
    // into the operation.
    Database.SaveResult sr = Database.insert(jobShr,false);

    // Process the save results.
    if(sr.isSuccess()){
       // Indicates success
       return true;
    }
    else {
       // Get first save result error.
       Database.Error err = sr.getErrors()[0];
       
       // Check if the error is related to trival access level.
       // Access level must be more permissive than the object's default.
       // These sharing records are not required and thus an insert exception is acceptable. 
       if(err.getStatusCode() == StatusCode.FIELD_FILTER_VALIDATION_EXCEPTION  &&  
                err.getMessage().contains('AccessLevel')){
          // Indicates success.
          return true;
       }
       else{
          // Indicates failure.
          return false;
       }
     }
 }


}