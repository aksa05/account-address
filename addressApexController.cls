public with sharing class addressApexController {
    
    @AuraEnabled
    public static void saveAddressInfo(AddressWrapper addressWrapper) {
        
        Address__c addressRecord = new Address__c();
        addressRecord.BillingStreet = addressWrapper.street;
        addressRecord.BillingCity = addressWrapper.city;
        addressRecord.BillingState = addressWrapper.state;
        addressRecord.BillingPostalCode = addressWrapper.zipCode;
        addressRecord.account__c = addressWrapper.accountId;

        insert addressRecord;
    }
}
