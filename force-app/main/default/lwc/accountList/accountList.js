import { LightningElement, track } from 'lwc';
import getAllAccounts from '@salesforce/apex/AccountService.getAllAccounts';

/**
 * @description Lightning Web Component to display a list of Accounts
 * Loads accounts from AccountService and displays them in a formatted table
 *
 * @fires accountselected - When user clicks on an account
 */
export default class AccountList extends LightningElement {
    @track accounts = [];
    @track isLoading = false;
    @track error = null;

    connectedCallback() {
        this.loadAccounts();
    }

    /**
     * Loads all accounts from the AccountService apex class
     */
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

    /**
     * Handles account row click
     * @param {Event} event - The click event
     */
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

    /**
     * Handles refresh button click
     */
    handleRefresh() {
        this.loadAccounts();
    }

    /**
     * Extracts a readable error message
     * @param {Object} error - The error object
     * @returns {String} Formatted error message
     */
    getErrorMessage(error) {
        if (error.body && error.body.message) {
            return error.body.message;
        }
        return 'An error occurred while loading accounts';
    }

    /**
     * Getter to check if accounts list is empty
     */
    get hasAccounts() {
        return this.accounts && this.accounts.length > 0;
    }

    /**
     * Getter to display account count
     */
    get accountCount() {
        return this.accounts ? this.accounts.length : 0;
    }
}
