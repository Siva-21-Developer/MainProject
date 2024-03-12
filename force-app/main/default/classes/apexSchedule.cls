public with sharing class apexSchedule implements Schedulable
{
    public apexSchedule() {

    }
    public void execute(SchedulableContext sp)
    {
        geoloc.mailsent();
    }
}