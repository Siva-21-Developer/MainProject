public class demobatch implements Database.Batchable<sObject>
{

    public DataBase.QueryLocator start(Database.BatchableContext st)
    {
        return Database.getQueryLocator('select id,name from contact');
    }

    public void execute(Database.BatchableContext st, List<Account> accDatas)
    {

    }

    public void finish(Database.BatchableContext st)
    {
        
    }

	// public Database.QueryLocator start(Database.BatchableContext Bc)
    // {
    //     return Database.getQueryLocator('select id, name, email from contact');
    // }
    
    // public void execute(Database.BatchableContext Bc, List<sObject> scope)
    // {
    //     List<contact> data = new List<Contact>();
    //     for(contact datas : (list<contact>)scope)
    //     {
    //           if(datas.email=='siva2122001@gmail.com')
    //           {
    //               contact da = new contact();
    //               da.Id = datas.Id;
    //               da.email = 'siva@gmail.com';
	// 			   data.add(da);
    //           }
    //     }
    //     update data;
    // }
    
    // public void finish(Database.BatchableContext bc)
    // {
        
    // }
    
}