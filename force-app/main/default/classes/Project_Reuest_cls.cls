public class Project_Reuest_cls {

    public static void main(List<Project_Request__c> ProjectRequest)
    {
        Messaging.SingleEmailMessage send_Mail = new Messaging.SingleEmailMessage();
       
        projectsendmail__c email_data = projectsendmail__c.getInstance();

        List<Messaging.SingleEmailMessage> mailsent = new List<Messaging.SingleEmailMessage>();

        for (Project_Request__c Project_Data : ProjectRequest) 
        {
            send_Mail.setToAddresses(new String[] {email_data.Email__c});
            send_Mail.setSubject('param0');
            mailsent.add(send_Mail);
        }

        Messaging.sendEmail(mailsent);
    }

}