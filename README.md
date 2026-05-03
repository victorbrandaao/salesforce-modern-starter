# ☁️ Salesforce Modern Starter Pack

![Salesforce](https://img.shields.io/badge/Salesforce-00A1E0?style=for-the-badge&logo=salesforce&logoColor=white)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=for-the-badge)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)

A professional, opinionated boilerplate bringing **Platform Engineering principles** to the Salesforce ecosystem.

Stop wasting hours configuring linters, formatters, and CI/CD pipelines from scratch. This starter pack provides a highly optimized Developer Experience (DX) out of the box, ensuring code quality and automated validations so you can focus on writing Apex and LWCs...

---

## ✨ Features (The "Why")

-   **Zero-Config Code Quality:** `Prettier` and `ESLint` fully configured with official Salesforce rules.
-   **Ironclad Commits:** `Husky` and `Lint-Staged` act as gatekeepers, automatically formatting and validating your code _before_ every commit.
-   **CI/CD Ready:** Includes a robust GitHub Actions workflow (`pr-validation.yml`) that automatically checks code formatting, runs linters, and prepares for LWC Jest testing on every Pull Request.
-   **Modern DX:** Built for modern Salesforce development using the latest `@salesforce/cli`.

---

## 🚀 Getting Started

### 1. Use this Template

Click the green **"Use this template"** button at the top of the repository to create your own project based on this structure.

### 2. Clone and Install

Clone your new repository to your local machine and install the DX dependencies:

```bash
git clone [https://github.com/YOUR_USERNAME/your-new-repo-name.git](https://github.com/victorbrandaao/salesforce-modern-starter)
cd your-new-repo-name
npm install
```
