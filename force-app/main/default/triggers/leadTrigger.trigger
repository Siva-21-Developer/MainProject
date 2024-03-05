trigger leadTrigger on Lead (before insert, before update) 
{
    if(Trigger.isBefore && Trigger.isUpdate)
    {
        leadCon.convert(Trigger.new);
    }
}