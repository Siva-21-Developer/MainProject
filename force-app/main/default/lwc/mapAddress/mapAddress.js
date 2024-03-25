import { LightningElement,wire } from 'lwc';

import AddressData from "@salesforce/apex/LightTest.AccountAddress"

export default class MapAddress extends LightningElement 
{

    AccountData;
    error;
  
    @wire(AddressData)
    wiredAccountData({error, data})
    {
        if(data)
        {
            this.AccountData = data.map((element) => {
                return {
                  location: {
                    Street: element.BillingStreet,
                    City: element.BillingCity,
                    State: element.BillingState
                  },
                  title: element.Name
                };
              });
        }else if (error) {
            this.error = error;
            this.mapMarkers = undefined;
          }
    }

}