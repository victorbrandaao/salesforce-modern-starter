public with sharing class AccountTriggerHandler {
    public void beforeInsert(List<Account> newAccounts) {
        validateAccountNames(newAccounts);
        setDefaultValues(newAccounts);
    }

    public void beforeUpdate(List<Account> newAccounts) {
        validateAccountNames(newAccounts);
    }

    private void validateAccountNames(List<Account> accounts) {
        for (Account acc : accounts) {
            if (String.isBlank(acc.Name)) {
                acc.addError('Account Name is required');
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
}
