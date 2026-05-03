/**
 * @description Trigger handler for Account sobject
 * Implements business logic for Account records
 *
 * @author Modern Starter
 * @since v1.0.0
 */
trigger AccountTrigger on Account(
    before insert,
    before update,
    after insert,
    after update,
    after delete,
    after undelete
) {
    AccountTriggerHandler handler = new AccountTriggerHandler();

    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            handler.beforeInsert(Trigger.new);
        }
        if (Trigger.isUpdate) {
            handler.beforeUpdate(Trigger.new, Trigger.oldMap);
        }
    }

    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            handler.afterInsert(Trigger.new);
        }
        if (Trigger.isUpdate) {
            handler.afterUpdate(Trigger.new, Trigger.oldMap);
        }
        if (Trigger.isDelete) {
            handler.afterDelete(Trigger.old);
        }
        if (Trigger.isUndelete) {
            handler.afterUndelete(Trigger.new);
        }
    }
}
