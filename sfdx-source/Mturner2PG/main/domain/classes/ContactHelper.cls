@namespaceAccessible
public without sharing class ContactHelper {
    @namespaceAccessible
    public static void changeContact(List<Contact> contacts){
        for(Contact c : contacts){
            c.LastName += ' foo';
        }
    }
}
