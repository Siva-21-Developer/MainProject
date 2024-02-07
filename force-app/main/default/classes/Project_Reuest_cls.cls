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
        List<Project__share> shareREcords = new List<Project__share>();

        for(Project_and_user_association__c record : projectUserData)
        {
            Project__share newShare= new Project__share();
            newShare.ParentId = record.Project__c;
            newShare.UserOrGroupId = record.User__c;
            newShare.AccessLevel = 'Read';
            newShare.RowCause = Schema.Project__share.RowCause.Manual;
            shareREcords.add(newShare);
        }
        insert shareREcords;
    }

    public static void accRuleUpdate(List<Project_and_user_association__c> projectUserData)
    {
        
    }

}






