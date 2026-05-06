@isTest
private class AccountServiceTest {
    @testSetup
    static void createAccounts() {
        insert new List<Account>{
            new Account(
                Name = 'Acme Corporation',
                Phone = '(555) 123-4567',
                Industry = 'Technology'
            ),
            new Account(
                Name = 'Global Tech Platform',
                Phone = '(555) 987-6543',
                Industry = 'Technology'
            ),
            new Account(Name = 'Farm Supply Co', Phone = '(555) 222-3333', Industry = 'Agriculture')
        };
    }

    @isTest
    static void getAllAccounts_returnsAccountsOrderedByName() {
        Test.startTest();
        List<Account> accounts = AccountService.getAllAccounts();
        Test.stopTest();

        System.assertEquals(3, accounts.size());
        System.assertEquals('Acme Corporation', accounts[0].Name);
        System.assertEquals('Farm Supply Co', accounts[1].Name);
        System.assertEquals('Global Tech Platform', accounts[2].Name);
    }

    @isTest
    static void getAccountsByIndustry_returnsOnlyMatchingAccounts() {
        Test.startTest();
        List<Account> accounts = AccountService.getAccountsByIndustry('Technology');
        Test.stopTest();

        System.assertEquals(2, accounts.size());
        for (Account accountRecord : accounts) {
            System.assertEquals('Technology', accountRecord.Industry);
        }
    }

    @isTest
    static void getAccountsByIndustry_returnsEmptyListForBlankIndustry() {
        Test.startTest();
        List<Account> accounts = AccountService.getAccountsByIndustry('');
        Test.stopTest();

        System.assertEquals(0, accounts.size());
    }

    @isTest
    static void getTotalAccountCount_returnsInsertedRecordCount() {
        Test.startTest();
        Integer totalCount = AccountService.getTotalAccountCount();
        Test.stopTest();

        System.assertEquals(3, totalCount);
    }

    @isTest
    static void createAccount_insertsRecordAndTrimsName() {
        Test.startTest();
        Account createdAccount = AccountService.createAccount(
            '  New Starter Account  ',
            '(555) 444-5555'
        );
        Test.stopTest();

        System.assertNotEquals(null, createdAccount.Id);
        System.assertEquals('New Starter Account', createdAccount.Name);

        Account persistedAccount = [
            SELECT Name, Phone
            FROM Account
            WHERE Id = :createdAccount.Id
            LIMIT 1
        ];
        System.assertEquals('New Starter Account', persistedAccount.Name);
        System.assertEquals('(555) 444-5555', persistedAccount.Phone);
    }

    @isTest
    static void createAccount_rejectsBlankAccountName() {
        Boolean threwException = false;

        try {
            AccountService.createAccount('   ', '(555) 444-5555');
        } catch (IllegalArgumentException exceptionRecord) {
            threwException = true;
            System.assertEquals('Account name cannot be blank', exceptionRecord.getMessage());
        }

        System.assert(threwException, 'Expected createAccount to reject blank names');
    }
}
