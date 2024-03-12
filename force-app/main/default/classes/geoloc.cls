public class geoloc
{
    public static void mailsent()
    {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new String[]{'siva2122001@gamil.com'});
        mail.setSubject('welcome world');
        mail.setPlainTextBody('welcome to the hello world');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
    }
}