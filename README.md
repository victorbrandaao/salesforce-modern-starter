# Salesforce Modern Starter

![Salesforce](https://img.shields.io/badge/Salesforce-00A1E0?style=for-the-badge&logo=salesforce&logoColor=white) ![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)

Template enxuto para Salesforce DX: estrutura organizada, boas praticas e script de setup para criar e popular Scratch Orgs rapidamente.

---

## English

Lean Salesforce DX starter with a clean project layout, linting, formatting, and a simple scratch-org setup script. Build features, not scaffolding.

### Highlights

- Minimal, production-minded structure (Apex, Triggers, LWC, Permission Sets)
- Prettier + ESLint configured
- Pre-commit hooks with Husky
- Scratch Org setup + deploy script

### Quick start

```bash
git clone https://github.com/your-username/salesforce-modern-starter.git
cd salesforce-modern-starter
npm install
npm run env:setup
```

### Scripts

- `npm run prettier` — format code
- `npm run lint` — run ESLint
- `npm test` — placeholder (no automated tests configured)
- `npm run env:setup` — create scratch org, deploy source and seed sample data

---

## Portugues

Starter leve para Salesforce DX com estrutura clara, lint e formatacao prontos, e script para criar Scratch Org e fazer deploy rapido.

### Destaques

- Estrutura enxuta (Apex, Triggers, LWC, Permission Sets)
- Prettier + ESLint configurados
- Husky para hooks locais
- Script de setup + deploy

### Inicio rapido

```bash
git clone https://github.com/seu-usuario/salesforce-modern-starter.git
cd salesforce-modern-starter
npm install
npm run env:setup
```

### Scripts

- `npm run prettier` — formata o codigo
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

Veja o guia em [CONTRIBUTING.md](CONTRIBUTING.md). Faça PRs pequenas e rode `npm run prettier` e `npm run lint` antes de abrir o PR.

## Licenca

MIT
