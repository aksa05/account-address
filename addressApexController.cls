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

    public class AddressWrapper {
        @AuraEnabled
        public String street{get;set;};
        @AuraEnabled
        public String city{get;set;};
        @AuraEnabled
        public String state{get;set;};
        @AuraEnabled
        public String zipCode{get;set;};
    }

}
