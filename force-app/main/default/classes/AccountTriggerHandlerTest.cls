@isTest
private class AccountTriggerHandlerTest {
    @isTest
    static void beforeInsert_setsDefaultIndustry() {
        Account accountRecord = new Account(Name = 'Starter Account');

        Test.startTest();
        insert accountRecord;
        Test.stopTest();

        Account savedAccount = [SELECT Industry FROM Account WHERE Id = :accountRecord.Id LIMIT 1];
        System.assertEquals('Other', savedAccount.Industry);
    }

    @isTest
    static void beforeUpdate_rejectsBlankAccountName() {
        Account accountRecord = new Account(Name = 'Valid Account');
        insert accountRecord;

        accountRecord.Name = '   ';

        Test.startTest();
        try {
            update accountRecord;
            System.assert(false, 'Expected update to fail when Account Name is blank');
        } catch (DmlException exceptionRecord) {
            System.assert(
                exceptionRecord.getMessage().contains('Account Name is required'),
                'Expected trigger validation message to be present'
            );
        }
        Test.stopTest();
    }

    @isTest
    static void beforeUpdate_allowsValidNameChanges() {
        Account accountRecord = new Account(Name = 'Original Account', Industry = 'Technology');
        insert accountRecord;

        accountRecord.Name = 'Updated Account';

        Test.startTest();
        update accountRecord;
        Test.stopTest();

        Account updatedAccount = [SELECT Name FROM Account WHERE Id = :accountRecord.Id LIMIT 1];
        System.assertEquals('Updated Account', updatedAccount.Name);
    }
}
