apexSchedule s = new apexSchedule();
String sch = '0 0 11 * * ?';
String jobID = System.schedule('Merge Job', sch, s);