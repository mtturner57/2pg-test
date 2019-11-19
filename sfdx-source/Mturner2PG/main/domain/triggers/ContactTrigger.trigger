trigger ContactTrigger on Contact (before insert, before update) {
    if(Trigger.isBefore && Trigger.isInsert){
        ContactHelper.changeContact(Trigger.New);
    }
}