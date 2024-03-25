import { LightningElement } from 'lwc';

export default class Buttons extends LightningElement 
{
    isvalues = true;

    handleClick()
    {
        if(this.isvalues == true)
        {
            this.isvalues = false;
        }
        else
        {
            this.isvalues = true;
        }
    }
}