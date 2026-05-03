# 📖 Exemplos de Código

Exemplos práticos de como usar os componentes e classes do projeto.

## Apex - AccountService

### Exemplo 1: Listar Todas as Contas

```apex
// Handler ou controlador
public class AccountListController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return AccountService.getAllAccounts();
    }
}
```

### Exemplo 2: Filtrar por Indústria

```apex
public class AccountListController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountsByIndustry(String industry) {
        return AccountService.getAccountsByIndustry(industry);
    }
}
```

### Exemplo 3: Criar Nova Conta com Validação

```apex
public class AccountCreationHandler {
    public static void createNewAccount(String name, String phone) {
        try {
            Account newAccount = AccountService.createAccount(name, phone);
            System.debug('Account criada com sucesso: ' + newAccount.Id);
        } catch (IllegalArgumentException e) {
            System.debug('Erro de validação: ' + e.getMessage());
        }
    }
}
```

### Exemplo 4: Anónimo Apex

```apex
// Executar via Developer Console ou SFDX CLI
List<Account> accounts = AccountService.getAllAccounts();
System.debug('Total de contas: ' + accounts.size());

for (Account acc : accounts) {
    System.debug(acc.Name + ' - ' + acc.Phone);
}
```

## Lightning Web Component - accountList

### Exemplo 1: Colocar em Flex Page

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<FlexiPage xmlns="http://soap.sforce.com/2006/04/metadata">
    <flexipage:region>
        <flexipage:item componentName="c:accountList" />
    </flexipage:region>
</FlexiPage>
```

### Exemplo 2: Usar em AppPage

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<AuraDefinitionBundle xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>66.0</apiVersion>
    <description>Custom Account Management App</description>
    <isVisible>true</isVisible>
    <markup>
        <![CDATA[
        <template>
            <c-account-list></c-account-list>
        </template>
        ]]>
    </markup>
</AuraDefinitionBundle>
```

### Exemplo 3: Capturar Evento de Seleção

```javascript
// Em outro componente pai
export default class AccountManager extends LightningElement {
    handleAccountSelected(event) {
        const selectedAccount = event.detail;
        console.log('Account selecionada:', selectedAccount.Name);

        // Fazer algo com a conta selecionada
        this.displayAccountDetails(selectedAccount.Id);
    }

    displayAccountDetails(accountId) {
        // Implementar lógica de exibição
    }
}
```

Template:

```html
<template>
    <c-account-list onaccountselected="{handleAccountSelected}"></c-account-list>
</template>
```

### Exemplo 4: Personalizar Estilos

```html
<template>
    <div class="my-custom-wrapper">
        <c-account-list></c-account-list>
    </div>
</template>
```

CSS:

```css
:host .my-custom-wrapper {
    padding: 2rem;
    background: #f5f5f5;
    border-radius: 8px;
}
```

## Triggers - AccountTrigger

### Exemplo 1: Validações Automáticas

O trigger automaticamente:

- Rejeita contas sem nome
- Define indústria padrão como "Other" se não informada
- Registra todas as operações no debug log

```apex
// Ao tentar inserir account sem nome:
Account acc = new Account();
insert acc; // → Erro: "Account Name is required"
```

### Exemplo 2: Auditoria de Mudanças

```apex
// Criar conta
Account acc = new Account(Name = 'Acme Corp', Phone = '555-1234');
insert acc;
// Log: "Account INSERT: [001RM00000IqEQQA3] Acme Corp - User: user@company.com"

// Atualizar conta
acc.Name = 'Acme Corporation';
update acc;
// Log: "Account name changed from 'Acme Corp' to 'Acme Corporation'"
// Log: "Account UPDATE: [001RM00000IqEQQA3] Acme Corporation - User: user@company.com"
```

## Testes Jest - accountList.test.js

### Exemplo 1: Executar Todos os Testes

```bash
npm test

# Saída esperada:
# PASS  force-app/main/default/lwc/accountList/accountList.test.js
#   c-account-list
#     ✓ should render the component with heading (45 ms)
#     ✓ should display loading state initially (12 ms)
#     ✓ should load and display accounts (28 ms)
#     ...
# Test Suites: 1 passed, 1 total
# Tests:       8 passed, 8 total
```

### Exemplo 2: Rodar Teste Específico

```bash
npm test -- --testNamePattern="should load and display accounts"
```

### Exemplo 3: Modo Watch

```bash
npm test -- --watch

# Salve um arquivo e os testes rodam automaticamente
```

### Exemplo 4: Gerar Cobertura de Código

```bash
npm test -- --coverage

# Resultado:
# File           | % Stmts | % Branch | % Funcs | % Lines
# accountList.js | 95.2    | 92.3     | 100     | 95.2
```

## Workflow Prático Completo

### Passo 1: Setup Inicial

```bash
# Clonar projeto
git clone https://github.com/seu-usuario/salesforce-modern-starter.git
cd salesforce-modern-starter

# Instalar dependências
npm install

# Criar Scratch Org
npm run env:setup
```

### Passo 2: Fazer Alterações

```bash
# Editar AccountService.cls
nano force-app/main/default/classes/AccountService.cls

# Adicionar novo método
public static Integer getAccountCountByIndustry(String industry) {
    return [SELECT COUNT() FROM Account WHERE Industry = :industry];
}
```

### Passo 3: Validar Localmente

```bash
# Formatar código
npm run prettier

# Validar com ESLint
npm run lint

# Executar testes
npm test
```

### Passo 4: Commit

```bash
git add -A
git commit -m "feat(accountService): add getAccountCountByIndustry method"

# Husky executa automaticamente:
# ✅ Prettier formatting
# ✅ Lint validation
```

### Passo 5: Push e Pull Request

```bash
# Push para seu fork
git push origin feature/sua-feature

# Abrir PR no GitHub
# GitHub Actions automaticamente:
# ✅ Executa testes
# ✅ Valida formatação
# ✅ Deploy em Scratch Org
```

## CI/CD - GitHub Actions

### Exemplo 1: Verificar Status das Ações

```bash
# URL no GitHub:
# https://github.com/seu-usuario/seu-repo/actions

# Ou via CLI:
gh run list
gh run view <run-id>
```

### Exemplo 2: Workflow Manual

Se precisar re-executar um workflow:

```bash
gh workflow run ci.yml --ref develop
```

### Exemplo 3: Variáveis de Ambiente

Para o workflow de deploy funcionar, configure:

```bash
# No repositório GitHub: Settings → Secrets and variables
# Adicione:
SALESFORCE_CLI_CREDENTIALS=base64_encoded_jwt
```

---

**Pronto para começar! 🚀**

Para mais exemplos e casos de uso, veja [DEVELOPMENT.md](./DEVELOPMENT.md)
