public with sharing class AccountService {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAllAccounts() {
        return [
            SELECT Id, Name, Phone, Industry
            FROM Account
            WITH USER_MODE
            ORDER BY Name ASC
            LIMIT 50
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountsByIndustry(String industry) {
        if (String.isBlank(industry)) {
            return new List<Account>();
        }
        return [
            SELECT Id, Name, Phone, Industry
            FROM Account
            WHERE Industry = :industry
            WITH USER_MODE
            ORDER BY Name ASC
            LIMIT 50
        ];
    }

    @AuraEnabled(cacheable=true)
    public static Integer getTotalAccountCount() {
        return [SELECT COUNT() FROM Account WITH USER_MODE];
    }

    @AuraEnabled
    public static Account createAccount(String accountName, String phone) {
        if (String.isBlank(accountName)) {
            throw new IllegalArgumentException('Account name cannot be blank');
        }

        Account newAccount = new Account(Name = accountName.trim(), Phone = phone);
        insert as user newAccount;
        return newAccount;
    }
}
