public class Project_Reuest_cls {


    public static void main(List<Project_Request__c> ProjectRequest)
    {
        Messaging.SingleEmailMessage send_Mail = new Messaging.SingleEmailMessage();
       
        

        projectsendmail__c email_data = projectsendmail__c.getInstance();
        EmailTemplate email_id = [select id,subject, body from emailtemplate where name ='project'];
        List<Messaging.SingleEmailMessage> mailsent = new List<Messaging.SingleEmailMessage>();
        
        
        for (Project_Request__c Project_Data : ProjectRequest) 
        {
            send_Mail.setSubject('Project Request');
            send_Mail.setTemplateId(email_id.id);
            send_Mail.setToAddresses(new String[] {email_data.Email__c});
            send_Mail.setTargetObjectId(Project_Data.Client__c);
            send_Mail.setWhatId(Project_Data.id);
            send_Mail.setSaveAsActivity(false);
            send_Mail.setUseSignature(false);
            mailsent.add(send_Mail);
        }

        Messaging.sendEmail(mailsent);
    }

}