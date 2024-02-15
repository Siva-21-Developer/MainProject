trigger userAcc on Project_and_user_association__c (before insert, After insert, After update, before delete) 
{
    if(Trigger.isAfter && Trigger.isInsert)
    {
        //Project_Reuest_cls.accessRule(Trigger.new);  
        Project_Reuest_cls.workAcc(Trigger.new);
    }

    if(Trigger.isAfter && Trigger.isUpdate)
    {
        Project_Reuest_cls.accUpdate(Trigger.new);
    }

    if(Trigger.isBefore && Trigger.isDelete)
    {
        Project_Reuest_cls.accDelete(Trigger.old);
    }

}