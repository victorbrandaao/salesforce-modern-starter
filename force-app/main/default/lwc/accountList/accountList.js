import { LightningElement, track } from 'lwc';
import getAllAccounts from '@salesforce/apex/AccountService.getAllAccounts';

export default class AccountList extends LightningElement {
    @track accounts = [];
    @track isLoading = false;
    @track error = null;

    connectedCallback() {
        this.loadAccounts();
    }

    loadAccounts() {
        this.isLoading = true;
        this.error = null;

        getAllAccounts()
            .then((result) => {
                this.accounts = result;
            })
            .catch((error) => {
                this.error = this.getErrorMessage(error);
                console.error('Error loading accounts:', error);
            })
            .finally(() => {
                this.isLoading = false;
            });
    }

    handleRowClick(event) {
        const accountId = event.currentTarget.dataset.id;
        const account = this.accounts.find((a) => a.Id === accountId);

        this.dispatchEvent(
            new CustomEvent('accountselected', {
                detail: account,
                composed: true,
                bubbles: true
            })
        );
    }

    handleRefresh() {
        this.loadAccounts();
    }

    getErrorMessage(error) {
        if (error.body && error.body.message) {
            return error.body.message;
        }
        return 'An error occurred while loading accounts';
    }

    get hasAccounts() {
        return this.accounts && this.accounts.length > 0;
    }

    get accountCount() {
        return this.accounts ? this.accounts.length : 0;
    }
}
