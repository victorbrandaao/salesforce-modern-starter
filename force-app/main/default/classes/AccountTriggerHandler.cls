public with sharing class AccountTriggerHandler {
    public void beforeInsert(List<Account> newAccounts) {
        validateAccountNames(newAccounts);
        setDefaultValues(newAccounts);
    }

    public void beforeUpdate(List<Account> newAccounts, Map<Id, Account> oldMap) {
        validateAccountNames(newAccounts);
        validateNameChanges(newAccounts, oldMap);
    }

    public void afterInsert(List<Account> newAccounts) {
        logAccountActivity(newAccounts, 'INSERT');
    }

    public void afterUpdate(List<Account> newAccounts, Map<Id, Account> oldMap) {
        logAccountActivity(newAccounts, 'UPDATE');
    }

    public void afterDelete(List<Account> oldAccounts) {
        logAccountActivity(oldAccounts, 'DELETE');
    }

    public void afterUndelete(List<Account> newAccounts) {
        logAccountActivity(newAccounts, 'UNDELETE');
    }

    private void validateAccountNames(List<Account> accounts) {
        for (Account acc : accounts) {
            if (String.isBlank(acc.Name)) {
                acc.addError('Account Name is required');
            }
        }
    }

    private void validateNameChanges(List<Account> newAccounts, Map<Id, Account> oldMap) {
        for (Account newAcc : newAccounts) {
            Account oldAcc = oldMap.get(newAcc.Id);
            if (oldAcc != null && oldAcc.Name != newAcc.Name) {
                System.debug(
                    'Account ' +
                        oldAcc.Id +
                        ' name changed from ' +
                        oldAcc.Name +
                        ' to ' +
                        newAcc.Name
                );
            }
        }
    }

    private void setDefaultValues(List<Account> accounts) {
        for (Account acc : accounts) {
            if (String.isBlank(acc.Industry)) {
                acc.Industry = 'Other';
            }
        }
    }

    private void logAccountActivity(List<Account> accounts, String action) {
        for (Account acc : accounts) {
            System.debug(
                'Account ' +
                    action +
                    ': [' +
                    acc.Id +
                    '] ' +
                    acc.Name +
                    ' - User: ' +
                    UserInfo.getUserName()
            );
        }
    }
}
