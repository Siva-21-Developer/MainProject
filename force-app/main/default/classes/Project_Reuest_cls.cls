public class Project_Reuest_cls 
{

    public static void main(List<Project_Request__c> ProjectRequest) // this method for email sent ..........
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


    public static void invoicemain(List<invoice__c> invoiceData)
    {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        projectsendmail__c email_data = projectsendmail__c.getInstance(); // Get Sales Admin email from custome settings.
        id conid = [SELECT Id, Email, MailingCity, LastName FROM Contact WHERE LastName = 'ceo'].Id;
        EmailTemplate email_id = [SELECT Id, Subject, Body FROM EmailTemplate WHERE Name = 'project']; // Get email Template Id.
        List<Messaging.SingleEmailMessage> mailsent = new List<Messaging.SingleEmailMessage>(); // Store the Mail.
        
        for (invoice__c Project_Data : invoiceData) // Asign the new data in for loop 
        {    
             mail.setTemplateId(email_id.Id); // Email Templeat Id.
             mail.setToAddresses(new String[]{email_data.Email__c}); // To address -- Sales Admin email.
             mail.setTargetObjectId(conid); // Id of the contact, lead.
             mail.setWhatId(Project_Data.id); // Id of the record. 
             mail.setSaveAsActivity(false); //
             mail.setUseSignature(false); //
        	 mailsent.add(mail); // Add the mail to List..              
        } 
        Messaging.sendEmail(mailsent); // Mail sent statement
        
    }

    public static void accessRule(List<Project_and_user_association__c> projectUserData) // this method for user access for project........
    {
        List<Project__share> shareRecords = new List<Project__share>(); // store the sharing access users ...
    
        Set<Id> project_id = new Set<Id>();

        for(Project_and_user_association__c record : projectUserData) // project and user association recrod ...
        {
            Project__share newShare = new Project__share();  // create a share object for project
            newShare.ParentId = record.Project__c;  // parent record (which Project)
            newShare.UserOrGroupId = record.User__c;  // User record (which user)
            newShare.AccessLevel = record.Status__c;  // Read or Write
            newShare.RowCause = Schema.Project__share.RowCause.Manual;  // 
            shareRecords.add(newShare);  // add the share access to List
            project_id.add(record.Project__c);
        }
        insert shareRecords;  // insert access -----


    }

    public static List<Project__Share> returnData(List<Project_and_user_association__c> updateData)
    {
        Map<id,id> shareData =new Map<id, id>();
        
        for(Project_and_user_association__c retData : updateData) 
        {
            shareData.put(retData.Project__c,retData.User__c);
        }

        List<Project__Share> share_Data = [SELECT AccessLevel, Id, ParentId, RowCause, UserOrGroupId FROM Project__Share WHERE ParentId =:shareData.keyset() and UserOrGroupId =: shareData.values()]; 

        return share_Data;
    }



    public static void accUpdate(List<Project_and_user_association__c> updateData)
    {

        List<Project__Share> Dataupdate = new List<Project__Share>();

        for (Project__share variable : returnData(updateData)) 
        {
            for (Project_and_user_association__c newvalue : updateData) {
                Project__Share newDataUpdate = new Project__Share();
                newDataUpdate.Id = variable.Id;
                newDataUpdate.AccessLevel = newvalue.Status__c;
                Dataupdate.add(newDataUpdate);
            }
        }

        Update Dataupdate;
    }


    public static void accDelete(List<Project_and_user_association__c> updateData)
    {

        List<Project__Share> Dataupdate = new List<Project__Share>();

        for (Project__share variable : returnData(updateData)) 
        {
            for (Project_and_user_association__c newvalue : updateData) {
                Project__Share newDataUpdate = new Project__Share();
                newDataUpdate.Id = variable.Id;
                Dataupdate.add(newDataUpdate);
            }
        }

        Delete Dataupdate;
    }


    public static List<Work_orders__c> findworkorderData(List<Project_and_user_association__c> ProjectData)
    {
        Map<Id,Project_and_user_association__c> project_ids = new Map<Id,Project_and_user_association__c>();
        for(Project_and_user_association__c data : ProjectData)
        {
            project_ids.put(data.Project__c, data);
        }

        List<Work_Orders__c> workorderData = [select id from Work_Orders__c WHERE Project__c=:project_ids.keyset()];

        return workorderData;
    }


    public static void workAcc(List<Project_and_user_association__c> ProjectData)
    {

       
        List<Work_Orders__Share> insertWorkData = new List<Work_Orders__Share>();

        for (Project_and_user_association__c variable : ProjectData)    
        {
            for (Work_Orders__c orderdata : findworkorderData(ProjectData)) 
            {
                    Work_Orders__Share Data = new Work_Orders__Share();
                    Data.ParentId = orderdata.Id;
                    Data.UserOrGroupId = variable.User__c;
                    Data.AccessLevel = variable.Status__c;
                    Data.RowCause = Schema.Work_Orders__Share.RowCause.Manual;
                    insertWorkData.add(Data);
            }    
        }

        insert insertWorkData;
        
    }


    public static List<Work_Orders__share> retvalue(List<Project_and_user_association__c>ProjectData)
    {
        Map<id, work_orders__c> shareData =new Map<id, work_orders__c>();
        
        for(work_orders__c retData : findworkorderData(ProjectData)) 
        {
            shareData.put(retData.Id,retData);
        }

        List<Work_Orders__share> share_Data = [SELECT AccessLevel,userorGroupid, Id FROM work_Orders__share WHERE ParentId =:shareData.keyset()];
        System.debug('work fine');
        return share_Data;
    }
    

    public static void workAccUpdate(List<Project_and_user_association__c>ProjectData)
    {

        List<Work_Orders__share> workupdate = new list<Work_Orders__share>();

        for (Work_Orders__share variable : retvalue(ProjectData)) 
        {
            for(Project_and_user_association__c userasValue : ProjectData)
            {
                if(variable.userorGroupid == userasValue.User__c)
                {
                    Work_Orders__Share Data = new Work_Orders__Share();
                    Data.Id = variable.Id;
                    Data.AccessLevel = userasValue.Status__c;
                    workupdate.add(Data);
                }
            }    
        }

        Update workupdate;
    }


    public static void workorderDelete(List<Project_and_user_association__c>ProjectData)
    {

        List<Work_Orders__share> workupdate = new list<Work_Orders__share>();

        for (Work_Orders__share variable : retvalue(ProjectData)) 
        {
            for(Project_and_user_association__c userasValue : ProjectData)
            {
                if(variable.userorGroupid == userasValue.User__c)
                {
                    Work_Orders__Share Data = new Work_Orders__Share();
                    Data.Id = variable.Id;
                    workupdate.add(Data);
                }
            }    
        }

        Delete workupdate;
    }





}
