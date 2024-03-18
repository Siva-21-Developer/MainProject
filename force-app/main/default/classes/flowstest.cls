public with sharing class flowstest 
{

    public class FlowInputs {
        @InvocableVariable(label='obj') public Integer OppId;
        @InvocableVariable public Boolean isOld;
    }
    @InvocableMethod(label='label' description='description')

    public static void test(List<integer> amount) 
    {
        for (Integer a : amount) 
        {
            a=300000;
        }  
        
    }
 
}