public with sharing class acc_data {
    public acc_data() {

    }


    public static void account_update(List<Account>accData)
    {
        for (Account data_upd : accData) 
        {
                data_upd.Phone = '81100159412';
        }


    }

}




// if(Trigger.isBefore && Trigger.isInsert)
// {
//     for(Account data : trigger.new)
//     {
//         data.Phone ='8110015941';
//     }
// }

// if(Trigger.isBefore && Trigger.isUpdate)
// { 
//     for(Account data : trigger.new)
//     {
//         data.Phone ='8110015941';
//     }
// }
