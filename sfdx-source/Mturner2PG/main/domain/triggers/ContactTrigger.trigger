trigger ContactTrigger on Contact (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        ContactHelper.changeContact(Trigger.New);
    }
}