public class con_user_datachange implements Database.Batchable<sObject>
{
    public Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator('select Old_Phone_Number__c,New_Mobile_Number__c from Data_change_Request__c');
    }
	
    public void Execute(Database.BatchableContext dc , List<sObject> condata)
    {
     	List<contact> conList = new List<contact>();
        List<user> userList = new List<user>();

        List<String> Phone = new List<String>();
           
       
       	for(Data_change_Request__c con : (List<Data_change_Request__c>)condata)
        {
           Phone.add(con.Old_Phone_Number__c);
        }
        
        List<contact> condatacol = [select id, phone , lastname from contact where Phone=:Phone];
        List<User> userdata = [select id, phone , lastname from user];
     
        for(Data_change_Request__c con : (List<Data_change_Request__c>)condata)
            {
              for(contact cons : condatacol)
                {
                    for(User usersid : userdata)
                    {
                        if (usersid.ContactId == cons.Id && con.Old_Phone_Number__c == cons.phone) 
                        {
                            user usersdata = new user();
                            usersdata.Id = usersid.Id;
                            usersdata.Phone = con.New_Mobile_Number__c;    
                            userList.add(usersdata);
                        }
                        if(con.Old_Phone_Number__c == cons.Phone)
                        {
                            Contact conts = new Contact();
                            conts.Id = cons.id;
                            conts.Phone = con.New_Mobile_Number__c;
                            conList.add(conts);
                        }
                    }
                } 
            }
        update conList;
        update userList;
    }
    
    public void Finish(Database.BatchableContext bc)
    {
        
    }
}