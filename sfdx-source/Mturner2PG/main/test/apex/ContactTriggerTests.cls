@isTest
private without sharing class ContactTriggerTests {
    @isTest
    private static void test(){
        Contact c = new Contact(LastName='TurnerBAHHH');

        Test.startTest();
        
        insert c;
        
        Test.stopTest();

        System.Assert([Select Count() from Contact where LastName = 'TurnerBAHHH foo'] == 1);
    }

    @isTest
    private static void test2(){
        Boolean isFailed = false;
        try{
            GlobalService.printContactFields();
        }
        catch(Exception ex){
            isFailed = true;
        }

        System.assert(!isFailed);
    }
}
