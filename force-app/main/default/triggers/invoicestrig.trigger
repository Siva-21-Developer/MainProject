trigger invoicestrig on invoice__c (before insert, after insert, before update, after update, after delete)
{
    if(Trigger.isBefore && Trigger.isInsert)
    {
        Project_Reuest_cls.invoicemain(Trigger.new);
    }
}