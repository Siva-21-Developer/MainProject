trigger project_request_trig on Project_Request__c (After insert) 
{
    if(Trigger.isAfter && Trigger.isInsert)
    {
        Project_Reuest_cls.main(Trigger.new);
    }

    if(Trigger.isAfter && Trigger.isUpdate)
    {
        for(Project_Request__c data : Trigger.newMap)
        {
            if(data.name = Trigger.oldMap.get(data.id).name)
            {
                
            }
        }
    }
}