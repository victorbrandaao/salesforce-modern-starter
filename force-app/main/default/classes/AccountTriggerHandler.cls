/**
 * @description Handler class for Account trigger
 * Separates trigger logic into reusable, testable methods
 *
 * @author Modern Starter
 * @since v1.0.0
 */
public with sharing class AccountTriggerHandler {
    /**
     * @description Executes logic before Account insert
     * @param newAccounts List of new Account records
     */
    public void beforeInsert(List<Account> newAccounts) {
        validateAccountNames(newAccounts);
        setDefaultValues(newAccounts);
    }

    /**
     * @description Executes logic before Account update
     * @param newAccounts List of updated Account records
     * @param oldMap Map of old Account records by Id
     */
    public void beforeUpdate(List<Account> newAccounts, Map<Id, Account> oldMap) {
        validateAccountNames(newAccounts);
        validateNameChanges(newAccounts, oldMap);
    }

    /**
     * @description Executes logic after Account insert
     * @param newAccounts List of newly created Account records
     */
    public void afterInsert(List<Account> newAccounts) {
        logAccountActivity(newAccounts, 'INSERT');
    }

    /**
     * @description Executes logic after Account update
     * @param newAccounts List of updated Account records
     * @param oldMap Map of old Account records by Id
     */
    public void afterUpdate(List<Account> newAccounts, Map<Id, Account> oldMap) {
        logAccountActivity(newAccounts, 'UPDATE');
    }

    /**
     * @description Executes logic after Account delete
     * @param oldAccounts List of deleted Account records
     */
    public void afterDelete(List<Account> oldAccounts) {
        logAccountActivity(oldAccounts, 'DELETE');
    }

    /**
     * @description Executes logic after Account undelete
     * @param newAccounts List of undeleted Account records
     */
    public void afterUndelete(List<Account> newAccounts) {
        logAccountActivity(newAccounts, 'UNDELETE');
    }

    /**
     * @description Validates that Account names are not blank
     * @param accounts List of Account records to validate
     */
    private void validateAccountNames(List<Account> accounts) {
        for (Account acc : accounts) {
            if (String.isBlank(acc.Name)) {
                acc.addError('Account Name is required');
            }
        }
    }

    /**
     * @description Validates critical changes to Account names
     * @param newAccounts List of new Account records
     * @param oldMap Map of old Account records
     */
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

    /**
     * @description Sets default values for new Accounts
     * @param accounts List of Account records
     */
    private void setDefaultValues(List<Account> accounts) {
        for (Account acc : accounts) {
            // Set default industry if not provided
            if (String.isBlank(acc.Industry)) {
                acc.Industry = 'Other';
            }
        }
    }

    /**
     * @description Logs Account activity for audit purposes
     * @param accounts List of Account records
     * @param action The operation type (INSERT, UPDATE, DELETE, UNDELETE)
     */
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
