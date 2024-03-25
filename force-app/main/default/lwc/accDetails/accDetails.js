import { LightningElement,wire } from 'lwc';
// import NAME_FIELD  from "@salesforce/schema/Account.Name";
// import REVENU_FIELD  from "@salesforce/schema/Account.AnnualRevenue";
// import INDUSTRY_FIELD from "@salesforce/schema/Account.Industry";
// import getAccountsData from "@salesforce/apex/LightTest.methodName";
import getAccountCount from '@salesforce/apex/LightTest.getAccountCount';
import getClientCount from '@salesforce/apex/LightTest.ClientCount';




export default class AccDetails extends LightningElement 
{

    ProjectCount;
    ClientCount;
    
    @wire(getAccountCount)
    wiredAccountCount({ error, data }) 
    {
        if (data) {
            this.ProjectCount = data;
        } else if (error) {
            console.error('Error retrieving account count: ', error);
        }
    }

    @wire(getClientCount)
    wiredClientCount({ error, data }) 
    {
        if (data) {
            this.ClientCount = data;
        } else if (error) {
            console.error('Error retrieving account count: ', error);
        }
    }

}