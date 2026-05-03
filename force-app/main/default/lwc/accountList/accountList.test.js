import { createElement } from 'lwc';
import AccountList from 'c/accountList';
import getAllAccounts from '@salesforce/apex/AccountService.getAllAccounts';

jest.mock(
    '@salesforce/apex/AccountService.getAllAccounts',
    () => ({
        default: jest.fn()
    }),
    { virtual: true }
);

describe('c-account-list', () => {
    let element;

    beforeEach(() => {
        element = createElement('c-account-list', {
            is: AccountList
        });
        document.body.appendChild(element);
    });

    afterEach(() => {
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
        jest.clearAllMocks();
    });

    it('should render the component with heading', async () => {
        await element.updateComplete;
        const heading = element.shadowRoot.querySelector('h1');
        expect(heading).not.toBeNull();
        expect(heading.textContent).toBe('Accounts');
    });

    it('should display loading state initially', async () => {
        getAllAccounts.mockReturnValue(new Promise(() => {})); // Never resolves
        await element.updateComplete;
        const loading = element.shadowRoot.querySelector('.text-center');
        expect(loading).not.toBeNull();
        expect(loading.textContent).toContain('Loading accounts');
    });

    it('should load and display accounts', async () => {
        const mockAccounts = [
            {
                Id: '001',
                Name: 'Acme Corp',
                Phone: '555-1234',
                Industry: 'Technology'
            },
            {
                Id: '002',
                Name: 'Global Tech',
                Phone: '555-5678',
                Industry: 'Finance'
            }
        ];

        getAllAccounts.mockResolvedValue(mockAccounts);
        await element.updateComplete;

        // Wait for async operations
        await new Promise((resolve) => setTimeout(resolve, 0));

        const rows = element.shadowRoot.querySelectorAll('tbody tr');
        expect(rows.length).toBe(2);
        expect(rows[0].textContent).toContain('Acme Corp');
        expect(rows[1].textContent).toContain('Global Tech');
    });

    it('should display error message when Apex fails', async () => {
        const errorMsg = 'Unexpected error occurred';
        const error = {
            body: {
                message: errorMsg
            }
        };

        getAllAccounts.mockRejectedValue(error);
        await element.updateComplete;

        // Wait for async operations
        await new Promise((resolve) => setTimeout(resolve, 0));

        const errorDiv = element.shadowRoot.querySelector('.bg-red-100');
        expect(errorDiv).not.toBeNull();
        expect(errorDiv.textContent).toContain(errorMsg);
    });

    it('should display empty state when no accounts', async () => {
        getAllAccounts.mockResolvedValue([]);
        await element.updateComplete;

        // Wait for async operations
        await new Promise((resolve) => setTimeout(resolve, 0));

        const emptyMsg = element.shadowRoot.querySelector('.text-gray-500');
        expect(emptyMsg.textContent).toContain('No accounts found');
    });

    it('should refresh accounts when refresh button clicked', async () => {
        const mockAccounts = [
            {
                Id: '001',
                Name: 'Account One',
                Phone: '555-1111',
                Industry: 'Tech'
            }
        ];

        getAllAccounts.mockResolvedValue(mockAccounts);
        await element.updateComplete;
        await new Promise((resolve) => setTimeout(resolve, 0));

        const refreshButton = element.shadowRoot.querySelector('button');
        refreshButton.click();

        expect(getAllAccounts).toHaveBeenCalledTimes(2); // Once on connectedCallback, once on click
    });

    it('should emit accountselected event when row clicked', async () => {
        const mockAccounts = [
            {
                Id: '001',
                Name: 'Test Account',
                Phone: '555-9999',
                Industry: 'Test'
            }
        ];

        getAllAccounts.mockResolvedValue(mockAccounts);
        await element.updateComplete;
        await new Promise((resolve) => setTimeout(resolve, 0));

        const eventHandler = jest.fn();
        element.addEventListener('accountselected', eventHandler);

        const row = element.shadowRoot.querySelector('tbody tr');
        row.click();

        expect(eventHandler).toHaveBeenCalled();
        expect(eventHandler.mock.calls[0][0].detail.Id).toBe('001');
        expect(eventHandler.mock.calls[0][0].detail.Name).toBe('Test Account');
    });

    it('should display correct account count', async () => {
        const mockAccounts = [
            { Id: '001', Name: 'Account 1', Phone: '111', Industry: 'Tech' },
            { Id: '002', Name: 'Account 2', Phone: '222', Industry: 'Finance' },
            { Id: '003', Name: 'Account 3', Phone: '333', Industry: 'Retail' }
        ];

        getAllAccounts.mockResolvedValue(mockAccounts);
        await element.updateComplete;
        await new Promise((resolve) => setTimeout(resolve, 0));

        const countText = element.shadowRoot.querySelector('.text-sm');
        expect(countText.textContent).toContain('3');
    });
});
