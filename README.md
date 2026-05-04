# Salesforce Modern Starter

![Salesforce](https://img.shields.io/badge/Salesforce-00A1E0?style=for-the-badge&logo=salesforce&logoColor=white) ![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)

Um template enxuto para iniciar projetos com Salesforce DX: estrutura clara, práticas básicas de qualidade de código e script de setup para Scratch Orgs.

---

## English — Quick summary

A compact starter for Salesforce DX that provides a clean project layout, linting, formatting and a simple scratch-org setup script. Focus on building features, not configuration.

# Salesforce Modern Starter

![Salesforce](https://img.shields.io/badge/Salesforce-00A1E0?style=for-the-badge&logo=salesforce&logoColor=white) ![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)

Um template enxuto para iniciar projetos com Salesforce DX: estrutura clara, práticas de qualidade e scripts para criar e popular Scratch Orgs rapidamente.

---

## English — Quick summary

A compact starter for Salesforce DX that provides a clean project layout, linting, formatting and a simple scratch-org setup script. Focus on building features, not configuration.

### Key features

- Minimal, production-minded structure (Apex, Triggers, LWC, Permission Sets)
- Prettier + ESLint configured
- Pre-commit hooks with Husky
- Script to create a Scratch Org and deploy quickly
- Small, focused example code using handler patterns

### Quick start

```bash
git clone https://github.com/your-username/salesforce-modern-starter.git
cd salesforce-modern-starter
npm install
npm run env:setup
```

### Useful scripts

- `npm run prettier` — format code
- `npm run lint` — run ESLint
- `npm test` — placeholder (no automated tests configured)
- `npm run env:setup` — create scratch org, deploy source and seed sample data

---

## Português — Resumo rápido

Template enxuto para Salesforce DX com estrutura organizada, lint e formatação prontos, e script para criação de Scratch Org. Ideal para iniciar projetos seguindo boas práticas.

### Principais pontos

- Estrutura enxuta: Apex, Triggers, LWC, Permission Sets
- Prettier + ESLint já configurados
- Husky para hooks locais
- Script de setup para Scratch Org e deploy rápido
- Código de exemplo pequeno e localizado

### Início rápido

```bash
git clone https://github.com/seu-usuario/salesforce-modern-starter.git
cd salesforce-modern-starter
npm install
npm run env:setup
```

### Scripts úteis

- `npm run prettier` — formata o código
- `npm run lint` — executa ESLint
- `npm test` — placeholder (sem testes automáticos configurados)
- `npm run env:setup` — cria scratch org, deploy e popula dados de exemplo

---

## Estrutura do projeto

```text
force-app/
├── main/default/classes/        # Apex
├── main/default/triggers/       # Triggers
├── main/default/permissionsets/ # Permission sets
└── main/default/lwc/            # Lightning Web Components
```

## Como contribuir

Veja o guia resumido em `CONTRIBUTING.md`. Faça PRs pequenas, execute `npm run prettier` e `npm run lint` antes de abrir o PR.

## Licença

MIT
