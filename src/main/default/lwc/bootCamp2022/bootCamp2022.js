import { LightningElement, api } from 'lwc';
import getRecordName from '@salesforce/apex/AccountController.getRecordName';

export default class BootCamp2022 extends LightningElement {
    @api recordId;
    accountName;
    currentTime;

    connectedCallback() {
        this.currentTime = 'current time';
        console.log('I am in connected callback');

        getRecordName({accountId: this.recordId})
            .then(
                result => {
                    this.accountName = result;
                }
            ).catch(
                error => {
                    console.log(error);
                }
            )
    }
}