trigger userAcc on Project_and_user_association__c (before insert, After insert) 
{
    if(Trigger.isAfter && Trigger.isInsert)
    {
        Project_Reuest_cls.accessRule(Trigger.new);
    }
}