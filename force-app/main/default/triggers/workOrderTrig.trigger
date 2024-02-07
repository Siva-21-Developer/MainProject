trigger workOrderTrig on SOBJECT (before insert) 
{

    if(Trigger.isAfter && Trigger.isInsert)
    {
        
    }

}