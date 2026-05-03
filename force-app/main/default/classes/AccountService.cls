public with sharing class AccountService {
    public static List<Account> getAllAccounts() {
        return [SELECT Id, Name, Phone, Email__c, Industry FROM Account ORDER BY Name ASC];
    }

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

    public static Integer getTotalAccountCount() {
        return [SELECT COUNT() FROM Account];
    }

    public static Account createAccount(String accountName, String phone) {
        if (String.isBlank(accountName)) {
            throw new IllegalArgumentException('Account name cannot be blank');
        }

        Account newAccount = new Account(Name = accountName.trim(), Phone = phone);
        insert newAccount;
        return newAccount;
    }
}
