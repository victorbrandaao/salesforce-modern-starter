# Salesforce Modern Starter

![Salesforce](https://img.shields.io/badge/Salesforce-00A1E0?style=for-the-badge&logo=salesforce&logoColor=white) ![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)

Template enxuto para Salesforce DX: estrutura organizada, boas práticas de engenharia, Apex testável, LWC inicial e automação para criar Scratch Orgs com deploy e testes.

---

## Demo (vídeo)

![Demo](./linkedin-video.gif)

---

## English

Lean Salesforce DX starter with a clean project layout, Apex tests, a starter LWC, formatting, linting, and scratch-org automation. Build features, not scaffolding.

### Highlights

- Minimal, production-minded structure (Apex, Triggers, LWC, Permission Sets)
- Prettier + ESLint configured with CI-ready checks
- Pre-commit hooks with Husky
- Scratch Org setup with deploy, permission assignment, sample data, and Apex tests

### Prerequisites

- Node.js 18+
- Salesforce CLI authenticated with Dev Hub access

### Quick start

```bash
git clone https://github.com/your-username/salesforce-modern-starter.git
cd salesforce-modern-starter
npm install
npm run env:setup
```

### Scripts

- `npm run prettier` — format code
- `npm run prettier:check` — check formatting without modifying files
- `npm run lint` — run ESLint
- `npm test` — validate the source deployment and run this starter's Apex tests in the default org
- `npm run validate` — run lint, formatting check, and Apex tests
- `npm run env:setup` — create scratch org, deploy source, assign permissions, seed sample data, and run Apex tests

---

## Português

Starter leve para Salesforce DX com estrutura clara, testes Apex, LWC inicial, lint, formatação e scripts para criar Scratch Org com deploy e validação.

### Destaques

- Estrutura enxuta (Apex, Triggers, LWC, Permission Sets)
- Prettier + ESLint configurados com checks prontos para CI
- Husky para hooks locais
- Script de setup com deploy, permissões, dados de exemplo e testes Apex

### Pré-requisitos

- Node.js 18+
- Salesforce CLI autenticado com acesso ao Dev Hub

### Início rápido

```bash
git clone https://github.com/seu-usuario/salesforce-modern-starter.git
cd salesforce-modern-starter
npm install
npm run env:setup
```

### Scripts

- `npm run prettier` — formata o código
- `npm run prettier:check` — verifica formatação sem alterar arquivos
- `npm run lint` — executa ESLint
- `npm test` — valida o deploy do código-fonte e executa os testes Apex deste starter na org padrão
- `npm run validate` — executa lint, check de formatação e testes Apex
- `npm run env:setup` — cria scratch org, faz deploy, atribui permissões, popula dados de exemplo e executa testes Apex

### Variáveis úteis do setup

- `SCRATCH_ORG_ALIAS` — altera o alias da Scratch Org (padrão: `ModernStarterOrg`)
- `SCRATCH_ORG_DURATION` — altera a duração da Scratch Org em dias (padrão: `30`)
- `SKIP_ORG_OPEN=true` — impede a abertura automática da org ao fim do setup

### CI

O workflow em `.github/workflows/ci.yml` roda lint e check de formatação em pushes e pull requests.

Para ativar a validação Salesforce no GitHub Actions, defina a variável `SF_RUN_VALIDATION=true` e configure os secrets:

- `SF_CLIENT_ID`
- `SF_USERNAME`
- `SF_JWT_KEY`

---

## Estrutura do projeto

```text
force-app/
├── main/default/classes/        # Apex
├── main/default/lwc/            # Lightning Web Components
├── main/default/triggers/       # Triggers
└── main/default/permissionsets/ # Permission sets
```

## Como contribuir

Veja o guia em [CONTRIBUTING.md](CONTRIBUTING.md). Faça PRs pequenas e rode `npm run prettier` e `npm run lint` antes de abrir o PR.

## Licença

MIT
