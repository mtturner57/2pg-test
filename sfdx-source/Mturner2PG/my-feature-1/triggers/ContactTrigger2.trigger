trigger ContactTrigger2 on Contact (before insert, before update) {
    if(Trigger.isBefore && Trigger.isInsert){
        ContactHelper.changeContact(Trigger.New);
    }
    else if(Trigger.isBefore && Trigger.isUpdate){
        ContactHelper2.updateContact(Trigger.New);
    }
}