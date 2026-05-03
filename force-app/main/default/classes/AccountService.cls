/**
 * @description Service class for Account-related operations.
 * Provides business logic for managing Salesforce Account records.
 *
 * @author Modern Starter
 * @since v1.0.0
 */
public with sharing class AccountService {
    /**
     * @description Retrieves all Account records with essential fields.
     *
     * @return List of Account records
     */
    public static List<Account> getAllAccounts() {
        return [SELECT Id, Name, Phone, Email__c, Industry FROM Account ORDER BY Name ASC];
    }

    /**
     * @description Retrieves Account records by Industry.
     *
     * @param industry The industry to filter by
     * @return List of matching Account records
     */
    public static List<Account> getAccountsByIndustry(String industry) {
        if (String.isBlank(industry)) {
            return new List<Account>();
        }
        return [
            SELECT Id, Name, Phone, Email__c, Industry
            FROM Account
            WHERE Industry = :industry
            ORDER BY Name ASC
        ];
    }

    /**
     * @description Gets total count of Accounts.
     *
     * @return Number of Account records
     */
    public static Integer getTotalAccountCount() {
        return [SELECT COUNT() FROM Account];
    }

    /**
     * @description Creates a new Account record with validation.
     *
     * @param accountName The Account name
     * @param phone The Account phone number
     * @return The created Account record
     *
     * @throws IllegalArgumentException when accountName is blank
     */
    public static Account createAccount(String accountName, String phone) {
        if (String.isBlank(accountName)) {
            throw new IllegalArgumentException('Account name cannot be blank');
        }

        Account newAccount = new Account(Name = accountName.trim(), Phone = phone);

        insert newAccount;
        return newAccount;
    }
}
