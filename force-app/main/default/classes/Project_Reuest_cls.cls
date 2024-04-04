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
             mail.setToAddresses(new String[]{'siva2122001+1@gmail.com'}); // To address -- Sales Admin email.
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


    ///////////////////////////////////////// ----- Sharing Access Code ----- //////////////////////////////////////////////////////

    public static void accessRule(List<Project_and_user_association__c> projectUserData) // this method for user access for project........
    {
        List<Project__share> shareRecords = new List<Project__share>(); // store the sharing access users ...
    
        //Set<Id> project_id = new Set<Id>();

        for(Project_and_user_association__c record : projectUserData) // project and user association recrod ...
        {
            Project__share newShare = new Project__share();  // create a share object for project
            newShare.ParentId = record.Project__c;  // parent record (which Project)
            newShare.UserOrGroupId = record.User__c;  // User record (which user)
            newShare.AccessLevel = record.Status__c;  // Read or Write
            newShare.RowCause = Schema.Project__share.RowCause.Manual;  // 
            shareRecords.add(newShare);  // add the share access to List
           // project_id.add(record.Project__c);
        }
        insert shareRecords;  // insert access -----


    }

    public static List<Project__Share> returnData(List<Project_and_user_association__c> updateData)// get project id and user id 
    {
        Map<id,id> shareData =new Map<id, id>(); // store the two ids in this map(project and user)
        
        for(Project_and_user_association__c retData : updateData) // this loop for access the data from project and user association
        {
            shareData.put(retData.Project__c,retData.User__c);// add the ids to sharedata
        }

        List<Project__Share> share_Data = [SELECT AccessLevel, Id, ParentId, RowCause, UserOrGroupId FROM Project__Share WHERE 
        ParentId =:shareData.keyset() and UserOrGroupId =: shareData.values()]; // get the id, accesslevel and parientid from project__share 

        return share_Data; // return the project__share data in list type
    }



    public static void accUpdate(List<Project_and_user_association__c> updateData) // project access update method
    {

        List<Project__Share> Dataupdate = new List<Project__Share>(); // store the update project access data

        for (Project__share variable : returnData(updateData))  // give the new updated data from the project and user association
                                                                // to filter with parent id and user group id
        {
            for (Project_and_user_association__c newvalue : updateData) // access the data using for loop
             {
                Project__Share newDataUpdate = new Project__Share();  // create a object for project_share
                newDataUpdate.Id = variable.Id; // parent id for update the record
                newDataUpdate.AccessLevel = newvalue.Status__c; // update the access level for the record
                Dataupdate.add(newDataUpdate); // add the updated data to list
            }
        }

        Update Dataupdate; // update the project access level.....
    }


    public static void accDelete(List<Project_and_user_association__c> updateData) // this method used to delete the sharing access
                                                                                   // when the the project and user association deleted
    {
        List<Project__Share> Dataupdate = new List<Project__Share>();  // store the deleted data

        for (Project__share variable : returnData(updateData)) // filter the data using parent id and userid
        {
            for (Project_and_user_association__c newvalue : updateData) // deleted record data 
            { 
                Project__Share newDataUpdate = new Project__Share(); // create the object for project share
                newDataUpdate.Id = variable.Id; // deleting record id 
                Dataupdate.add(newDataUpdate);  // add the data to list
            }
        }

        Delete Dataupdate; // delete the records.....
    }


    /////////////////////////////////// ---- Filtering the data foe the workdorder ---- /////////////////////////////////////

    public static List<Work_orders__c> findworkorderData(List<Project_and_user_association__c> ProjectData) // this method used for work order record with project id
    {
        Map<Id,Project_and_user_association__c> project_ids = new Map<Id,Project_and_user_association__c>(); // store the id and data 
        for(Project_and_user_association__c data : ProjectData) ///
        {
            project_ids.put(data.Project__c, data); // add the project id and project and user accociation 
        }

        List<Work_Orders__c> workorderData = [select id from Work_Orders__c WHERE Project__c=:project_ids.keyset()]; // get the work order data for insert, update and delete..

        return workorderData; // return the work order data in list type....
    }


    public static List<Work_Orders__share> retvalue(List<Project_and_user_association__c>ProjectData) // this method use for the filter the work order share data
    {
        Map<id, work_orders__c> shareData =new Map<id, work_orders__c>();  // store the id and workorder
        
        for(work_orders__c retData : findworkorderData(ProjectData)) ///
        {
            shareData.put(retData.Id,retData);  // add the id and data to list
        }

        List<Work_Orders__share> share_Data = [SELECT AccessLevel,userorGroupid, Id FROM work_Orders__share WHERE ParentId =:shareData.keyset()]; // filter the record 
                                                                                                                                                 // using work order id...

        return share_Data; // return the work_Order__share data in a list type.....
    }
    
///////////////////////////////////////////////// --- End --- ///////////////////////////////////////////



//////////////////////////////////////////////// --- Work order access ---- code ///////////////////////////


    public static void workAcc(List<Project_and_user_association__c> ProjectData)  // insert the work order share method
    {
        List<Work_Orders__Share> insertWorkData = new List<Work_Orders__Share>(); // store the work order data
        for (Project_and_user_association__c variable : ProjectData)    // 
        {
            for (Work_Orders__c orderdata : findworkorderData(ProjectData)) //send the data to findworkderData method for filter -- which workorder associate with project..... 
            {
                    Work_Orders__Share Data = new Work_Orders__Share();  // object for workorder share.
                    Data.ParentId = orderdata.Id; // work order id
                    Data.UserOrGroupId = variable.User__c; // user id for grant the access
                    Data.AccessLevel = variable.Status__c; // read and edit access
                    Data.RowCause = Schema.Work_Orders__Share.RowCause.Manual; // rowcause manual 
                    insertWorkData.add(Data); // add the data to list..
            }    
        }
        insert insertWorkData;     // insert the data to 
    }




    public static void workAccUpdate(List<Project_and_user_association__c>ProjectData) // update the work order share access
    {

        List<Work_Orders__share> workupdate = new list<Work_Orders__share>(); // store the work order share update records

        for (Work_Orders__share variable : retvalue(ProjectData))  // give the project and user association data to retvalue method for filter
        {
            for(Project_and_user_association__c userasValue : ProjectData) ///
            {
                if(variable.userorGroupid == userasValue.User__c) // this if statement for compare the share access data with user__c and userorgroupid
                {
                    Work_Orders__Share Data = new Work_Orders__Share(); // work order object....
                    Data.Id = variable.Id;  // work order update id
                    Data.AccessLevel = userasValue.Status__c; // update read and edit access
                    workupdate.add(Data);  // add the data to list
                }
            }    
        }

        Update workupdate; // update the work order access ...
    }


    public static void workorderDelete(List<Project_and_user_association__c>ProjectData)  // work order share delete method....
    {

        List<Work_Orders__share> workupdate = new list<Work_Orders__share>(); // store the work order delete record...

        for (Work_Orders__share variable : retvalue(ProjectData))  // filter the data
        {
            for(Project_and_user_association__c userasValue : ProjectData) //
            {
                if(variable.userorGroupid == userasValue.User__c) // this if statement for compare the share access data with user__c and userorgroupid
                {
                    Work_Orders__Share Data = new Work_Orders__Share(); // work order object...
                    Data.Id = variable.Id; // id rfor which record could be deleted
                    workupdate.add(Data); // add the data to list....
                }
            }    
        }

        Delete workupdate; // delete the work order share...............
    }
}
