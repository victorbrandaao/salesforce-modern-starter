# 📚 Documentação de Desenvolvimento

Este documento descreve a estrutura e como usar os componentes adicionados ao projeto.

## 🏗️ Arquitetura

### Classes Apex

#### `AccountService`

Classe de serviço que fornece operações CRUD e queries para a entidade Account.

**Métodos principais:**

- `getAllAccounts()` - Retorna todas as contas ordenadas por nome
- `getAccountsByIndustry(String industry)` - Filtra contas por indústria
- `getTotalAccountCount()` - Retorna total de contas
- `createAccount(String name, String phone)` - Cria nova conta com validação

**Exemplo de uso em Apex:**

```apex
// Obter todas as contas
List<Account> accounts = AccountService.getAllAccounts();

// Filtrar por indústria
List<Account> techAccounts = AccountService.getAccountsByIndustry('Technology');

// Contar total
Integer total = AccountService.getTotalAccountCount();

// Criar nova conta
Account newAcc = AccountService.createAccount('Acme Corp', '555-1234');
```

#### `AccountTriggerHandler`

Handler que centraliza a lógica de trigger para a entidade Account seguindo o padrão de separação de concerns.

**Métodos:**

- `beforeInsert()` - Validações e valores padrão antes de inserção
- `beforeUpdate()` - Validações antes de atualização
- `afterInsert()` - Logging após inserção
- `afterUpdate()` - Logging após atualização
- `afterDelete()` - Logging após deleção
- `afterUndelete()` - Logging após restauração

### Lightning Web Components

#### `c-account-list`

Componente LWC que exibe uma lista de contas em formato tabular com funcionalidades interativas.

**Funcionalidades:**

- ✅ Carregamento automático de contas via serviço Apex
- ✅ Tabela responsiva com colunas: Nome, Telefone, Indústria
- ✅ Estados de carregamento e erro
- ✅ Botão de refresh para atualizar dados
- ✅ Eventos customizados ao clicar em linha
- ✅ Estilos Tailwind CSS integrados
- ✅ Suporta múltiplos tipos de página (Record, App, Home)

**Uso em FlexiPage/AppPage:**

```xml
<flexipage:region>
    <flexipage:item componentName="c:accountList" />
</flexipage:region>
```

**Captura de eventos:**

```javascript
element.addEventListener('accountselected', (event) => {
    console.log('Account selecionada:', event.detail);
});
```

### Testes

#### `accountList.test.js`

Suite de testes Jest para o componente `accountList` com cobertura abrangente:

- Renderização do componente
- Estados de carregamento
- Carregamento e exibição de dados
- Tratamento de erros
- Estado vazio (sem dados)
- Funcionalidade de refresh
- Emissão de eventos customizados
- Contagem de registros

**Executar testes:**

```bash
npm test
```

**Gerar relatório de cobertura:**

```bash
npm test -- --coverage
```

## 🔄 Fluxo de Trabalho

### 1. Desenvolvimento Local

```bash
# Instalar dependências
npm install

# Criar Scratch Org
npm run env:setup

# Validar código antes de commit
npm run prettier   # Formatar
npm run lint       # Validar

# Executar testes
npm test
```

### 2. Commit com Validação Automática

Graças ao **Husky** + **Lint-Staged**, seus commits são automaticamente:

- ✅ Formatados com Prettier
- ✅ Validados com ESLint
- ✅ Verificados antes de serem pushed

### 3. Pull Request

Ao criar um PR, os workflows do GitHub Actions executam automaticamente:

- **Code Quality Checks**: Prettier e ESLint
- **Jest Tests**: Testes unitários e cobertura
- **Salesforce Deploy**: Deploy em Scratch Org de teste

## 📦 Scripts Disponíveis

```bash
npm run prepare      # Setup Husky (automático)
npm run lint         # Executar ESLint
npm run prettier     # Formatar com Prettier
npm test             # Executar testes Jest
npm run env:setup    # Criar e configurar Scratch Org
npm run release      # Gerar nova versão (SemVer)
```

## 🎯 Boas Práticas

### Apex

- ✅ Use `with sharing` em classes públicas
- ✅ Valide inputs em métodos públicos
- ✅ Use JSDoc para documentação
- ✅ Implemente tratamento de erros
- ✅ Evite SOQL em loops

### LWC

- ✅ Use decoradores `@track` e `@api` apropriadamente
- ✅ Implemente tratamento de erros com try/catch
- ✅ Use eventos customizados para comunicação
- ✅ Adicione testes com Jest
- ✅ Siga convenção de nomenclatura `c-kebab-case`

### Git

- ✅ Commits pequenos e focados
- ✅ Mensagens descritivas (feat:, fix:, test:, ci:, docs:)
- ✅ Uma funcionalidade por PR
- ✅ Rebase em vez de merge squash quando possível

## 🐛 Troubleshooting

### ESLint não encontra módulos

```bash
npm install --ignore-scripts
npm run lint
```

### Prettier não formata arquivos Apex

Certifique-se que `prettier-plugin-apex` está instalado:

```bash
npm install --save-dev prettier-plugin-apex
```

### Scratch Org não cria

```bash
# Verificar autenticação Salesforce
sf org list
sf org login web

# Tentar novamente
npm run env:setup
```

## 📚 Recursos Adicionais

- [Salesforce DX CLI](https://developer.salesforce.com/tools/sfdxcli)
- [Lightning Web Components](https://developer.salesforce.com/docs/component-library/documentation/lwc)
- [Jest Testing Framework](https://jestjs.io/)
- [Prettier Code Formatter](https://prettier.io/)
- [ESLint](https://eslint.org/)

---

**Última atualização:** 3 de maio de 2026
