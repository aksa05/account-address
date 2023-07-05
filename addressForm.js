import { LightningElement, track,wire } from 'lwc';
import saveAddressInfo from '@salesforce/apex/addressApexController.saveAddressInfo';
import { CurrentPageReference } from 'lightning/navigation';

export default class AddressForm extends LightningElement {
    @track street;
    @track city;
    @track state;
    @track zipCode;
    @track accId;

    @wire(CurrentPageReference) pageRef;

    connectedCallback() {
        if (this.pageRef) {
            this.accId = this.pageRef.state.c__parentId;
            console.log('Parent Record ID:', this.accId);
        }
    }

    handleStreetChange(event) {
        this.street = event.target.value;
    }

    handleCityChange(event) {
        this.city = event.target.value;
    }

    handleStateChange(event) {
        this.state = event.target.value;
    }

    handleZipCodeChange(event) {
        this.zipCode = event.target.value;
    }

    saveAddress() {
        const address = {
            street: this.street,
            city: this.city,
            state: this.state,
            zipCode: this.zipCode,
            accountId: this.accId 
        };

        saveAddressInfo({ addressWrapper: address })
            .then(result => {
                console.log('Address saved successfully:', result);
            })
            .catch(error => {
                console.error('Error saving address:', error);
            });
    }
}
