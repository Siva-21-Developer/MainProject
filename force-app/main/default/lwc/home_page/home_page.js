import { LightningElement,wire } from 'lwc';
import testvalue from '@salesforce/apex/geoloc.testvalue';

export default class Home_page extends LightningElement {
    @wire(testvalue) values;
}