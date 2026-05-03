# ☁️ Salesforce Modern Starter

![Salesforce](https://img.shields.io/badge/Salesforce-00A1E0?style=for-the-badge&logo=salesforce&logoColor=white)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)

**[🇬🇧 English](#-english) | [🇧🇷 Português](#-português)**

---

## 🇬🇧 English

Professional starter template for Salesforce DX with built-in code quality, CI/CD automation, and modern development practices.

### ✨ Features

- **Code Quality**: Prettier + ESLint pre-configured
- **Pre-commit Hooks**: Husky validates every commit
- **CI/CD Ready**: GitHub Actions for testing and deployment
- **Lightning Web Components**: Tailwind CSS integrated
- **Tests**: Jest for LWC unit testing
- **Best Practices**: Handler pattern, with sharing, proper conventions

### 🚀 Quick Start

```bash
git clone https://github.com/your-username/salesforce-modern-starter.git
cd salesforce-modern-starter
npm install
npm run env:setup
```

### 📦 Scripts

```bash
npm run prettier       # Format code
npm run lint          # Check code quality
npm test              # Run tests
npm run env:setup     # Create Scratch Org
```

### 🏗️ Structure

```
force-app/
├── classes/          # Apex classes
├── lwc/             # Lightning Web Components
├── triggers/        # Apex triggers
└── permissionsets/  # Permissions
```

---

## 🇧🇷 Português

Template profissional para Salesforce DX com qualidade de código, CI/CD e desenvolvimento moderno.

### ✨ Funcionalidades

- **Qualidade de Código**: Prettier + ESLint pré-configurados
- **Git Hooks**: Husky valida cada commit
- **CI/CD Pronto**: GitHub Actions para testes e deploy
- **Lightning Web Components**: Tailwind CSS integrado
- **Testes**: Jest para testes unitários LWC
- **Melhores Práticas**: Padrão handler, with sharing, convenções

### 🚀 Início Rápido

```bash
git clone https://github.com/seu-usuario/salesforce-modern-starter.git
cd salesforce-modern-starter
npm install
npm run env:setup
```

### 📦 Scripts

```bash
npm run prettier       # Formatar código
npm run lint          # Verificar qualidade
npm test              # Executar testes
npm run env:setup     # Criar Scratch Org
```

### 🏗️ Estrutura

```
force-app/
├── classes/          # Classes Apex
├── lwc/             # Lightning Web Components
├── triggers/        # Apex triggers
└── permissionsets/  # Permissões
```

---

## 📚 Documentação

- [DEVELOPMENT.md](DEVELOPMENT.md) - Arquitetura e exemplos
- [CODE_EXAMPLES.md](CODE_EXAMPLES.md) - Exemplos práticos
- [CONTRIBUTING.md](CONTRIBUTING.md) - Como contribuir

## 📝 Licença

MIT - Sinta-se livre para usar este template em seus projetos

---

**Made with ❤️ for Salesforce developers**
