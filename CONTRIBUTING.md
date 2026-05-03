# Contributing / Contribuindo

**[🇬🇧 English](#english) | [🇧🇷 Português](#português)**

---

## English

### Setup

```bash
git clone https://github.com/your-username/salesforce-modern-starter.git
cd salesforce-modern-starter
npm install
```

### Before Submitting a PR

- `npm run prettier` - Format code
- `npm run lint` - Check code quality
- `npm test` - Run tests
- Keep commits small and focused
- Write clear commit messages

### Commit Message Format

```
<type>(<scope>): <description>

<optional body>
```

**Types:** feat, fix, test, docs, ci, refactor, chore, style

**Examples:**

```bash
git commit -m "feat(accountService): add new query method"
git commit -m "fix(accountList): resolve loading state bug"
git commit -m "test(accountList): add Jest tests for edge cases"
```

### Code Style

- Use `with sharing` in public Apex classes
- Keep methods small and focused
- Add meaningful comments only when needed
- Follow Salesforce naming conventions
- Use proper error handling

---

## Português

### Setup

```bash
git clone https://github.com/seu-usuario/salesforce-modern-starter.git
cd salesforce-modern-starter
npm install
```

### Antes de Enviar um PR

- `npm run prettier` - Formatar código
- `npm run lint` - Verificar qualidade
- `npm test` - Executar testes
- Mantenha commits pequenos e focados
- Escreva mensagens de commit claras

### Formato de Mensagem de Commit

```
<tipo>(<escopo>): <descrição>

<corpo opcional>
```

**Tipos:** feat, fix, test, docs, ci, refactor, chore, style

**Exemplos:**

```bash
git commit -m "feat(accountService): add new query method"
git commit -m "fix(accountList): resolve loading state bug"
git commit -m "test(accountList): add Jest tests for edge cases"
```

### Estilo de Código

- Use `with sharing` em classes Apex públicas
- Mantenha métodos pequenos e focados
- Adicione comentários apenas quando necessário
- Siga convenções de nomenclatura Salesforce
- Use tratamento de erros apropriado

---

**Thank you for contributing! / Obrigado por contribuir!**

```javascript
describe('c-component-name', () => {
    let element;

    beforeEach(() => {
        element = createElement('c-component-name', {
            is: ComponentName
        });
        document.body.appendChild(element);
    });

    it('should do something specific', async () => {
        // Arrange
        // Act
        // Assert
    });
});
```

## 🔄 Processo de Pull Request

1. **Push sua branch** para seu fork
2. **Abra um PR** contra a branch `develop`
3. **Preencha o template** de PR completamente
4. **Aguarde revisão** da comunidade
5. **Solicite ajustes** se necessário
6. **Merge automático** após aprovação

## 📋 Template de PR

```markdown
## 📝 Descrição

Descrição clara do que foi mudado e por quê.

## 🔗 Relacionado a Issue

Closes #123

## 🧪 Tipo de Mudança

- [ ] 🐛 Bug fix
- [ ] ✨ Nova feature
- [ ] 📚 Documentação
- [ ] 🔧 Configuração

## ✅ Checklist

- [ ] Testes passando
- [ ] Código formatado
- [ ] Documentação atualizada
- [ ] Sem breaking changes
```

## 🐛 Reportando Bugs

Ao relatar um bug, inclua:

1. **Descrição clara** do problema
2. **Passos para reproduzir**
3. **Comportamento esperado** vs **real**
4. **Screenshots** se aplicável
5. **Informações do ambiente** (Salesforce org version, Node version, etc)

### Exemplo

```markdown
# Bug Report

## Descrição

AccountList component não carrega dados ao renderizar.

## Passos para Reproduzir

1. Adicionar componente c-account-list à página
2. Recarregar página
3. Verificar console

## Esperado

Dados de contas devem carregar automaticamente.

## Atual

Mensagem de erro: "Cannot read properties of undefined"

## Ambiente

- Node: 20.x
- SF API: 66.0
- OS: macOS
```

## 💭 Sugestões e Discussões

Para sugestões e discussões sobre features futuras, abra uma **Discussion** em vez de uma Issue.

## 📞 Contato

- 📧 Email: [seu-email@example.com]
- 🐦 Twitter: [@seu-twitter]
- 💬 Slack: [seu-workspace]

## 📜 Licença

Ao contribuir, você concorda que suas contribuições serão licenciadas sob a mesma licença MIT do projeto.

---

**Obrigado por contribuir! 🙌**
