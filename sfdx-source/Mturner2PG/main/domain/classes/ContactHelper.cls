public without sharing class ContactHelper {
    public static void changeContact(List<Contact> contacts){
        for(Contact c : contacts){
            c.LastName += ' foo';
        }
    }
}
