import { LightningElement } from 'lwc';
import getAllAccounts from '@salesforce/apex/AccountService.getAllAccounts';

const COLUMNS = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    { label: 'Industry', fieldName: 'Industry' }
];

export default class AccountExplorer extends LightningElement {
    columns = COLUMNS;
    accounts = [];
    error;
    isLoading = true;

    connectedCallback() {
        this.loadAccounts();
    }

    async loadAccounts() {
        this.isLoading = true;
        this.error = undefined;

        try {
            this.accounts = await getAllAccounts();
        } catch (error) {
            this.error = error;
        } finally {
            this.isLoading = false;
        }
    }

    get accountsData() {
        return this.accounts;
    }

    get hasAccounts() {
        return !this.isLoading && this.accountsData.length > 0;
    }

    get isLoaded() {
        return !this.isLoading;
    }

    get errorMessage() {
        const error = this.error;

        if (!error) {
            return '';
        }

        if (Array.isArray(error.body)) {
            return error.body.map((entry) => entry.message).join(', ');
        }

        return error.body && error.body.message ? error.body.message : error.message;
    }
}
