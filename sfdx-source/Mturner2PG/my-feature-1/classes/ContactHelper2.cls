public with sharing class ContactHelper2 {
    public static void updateContact(List<Contact> contacts){
        for(Contact c : contacts){
            c.LastName += ' bar';
        }
    }
}
