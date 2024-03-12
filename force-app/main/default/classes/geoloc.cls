public class geoloc
{
    public static void mailsent()
    {
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
        String[] toAddress = new String[]{'siva.s.n.1821@gmail.com'};
        Messaging.SingleEmailMessage myEmail = new Messaging.SingleEmailMessage();
        myEmail.setToAddresses(toAddress);
        myEmail.setSubject('subject');    
        emailList.add(myEmail);
        Messaging.sendEmail(emailList); 
    }
}