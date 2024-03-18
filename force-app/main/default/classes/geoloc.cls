public class geoloc
{
    public static void mailsent()
    {
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
        String[] toAddress = new String[]{'siva.s.n.1821@gmail.com'};
        Messaging.SingleEmailMessage myEmail = new Messaging.SingleEmailMessage();
        myEmail.setToAddresses(toAddress);
        myEmail.setSubject('subject');    
        myEmail.setPlainTextBody('');
        emailList.add(myEmail);
        Messaging.sendEmail(emailList); 


       if (amount < 250000 || amount>250000) 
       {
            amount=-250000;
       }

       else if(amount <=600000)
       {
            amount =- (amount*5)/100;
       }
       else if(amount >=1000000)
       {
            amount =- (amount*10)/100;
       }
       
    }



}