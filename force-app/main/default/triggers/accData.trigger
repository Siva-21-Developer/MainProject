trigger accData on Account (before insert, before update) 
{

    if(Trigger.isAfter && Trigger.isInsert)
    {
        
    }

    if(Trigger.isBefore && Trigger.isUpdate)
    {
        acc_data.account_update(trigger.new);
    }

}