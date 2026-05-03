# 🤝 Diretrizes de Contribuição

Obrigado por querer contribuir com o projeto! Este documento fornece diretrizes para ajudar você a começar.

## 📋 Antes de Começar

1. Faça um fork do repositório
2. Clone seu fork localmente
3. Crie uma branch para sua feature (`git checkout -b feature/sua-feature`)
4. Instale as dependências (`npm install`)

## ✅ Checklist de Qualidade

Antes de submeter um Pull Request, certifique-se de:

- [ ] Código formatado com `npm run prettier`
- [ ] Testes passando com `npm test`
- [ ] ESLint sem erros com `npm run lint`
- [ ] Commits com mensagens claras seguindo padrão
- [ ] Documentação atualizada (JSDoc, comentários)
- [ ] Sem dependências não necessárias
- [ ] Sem console.log em código produção

## 📝 Estrutura de Commit

Siga o padrão de commits semânticos:

```
<tipo>(<escopo>): <descrição>

<corpo opcional>
<rodapé opcional>
```

### Tipos de Commit

| Tipo     | Descrição                           |
| -------- | ----------------------------------- |
| feat     | Nova funcionalidade                 |
| fix      | Correção de bug                     |
| test     | Adição ou modificação de testes     |
| docs     | Documentação apenas                 |
| style    | Formatação e estilos                |
| ci       | Configuração de CI/CD               |
| chore    | Alterações de build ou dependências |
| refactor | Refatoração de código               |

### Exemplos

```bash
# Feature nova
git commit -m "feat(accountList): add search functionality"

# Correção de bug
git commit -m "fix(accountService): prevent null pointer exception"

# Testes
git commit -m "test(accountList): add jest tests for error handling"

# Documentação
git commit -m "docs: add API documentation for AccountService"

# CI/CD
git commit -m "ci: add code coverage threshold to GitHub Actions"
```

## 🎯 Diretrizes de Feature

### Para Apex

```apex
/**
 * @description Clear description of what the method does
 * @param paramName Description of parameter
 * @return Description of return value
 * @throws ExceptionType When this exception is thrown
 */
public static ReturnType methodName(ParamType paramName) {
    // Implementation
}
```

### Para LWC

```javascript
/**
 * @description Component purpose and behavior
 * @fires eventName - Description of event
 */
export default class ComponentName extends LightningElement {
    @track trackableVariable;
    @api apiProperty;

    connectedCallback() {
        // Lifecycle
    }
}
```

### Para Testes

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
