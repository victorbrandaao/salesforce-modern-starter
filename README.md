# ☁️ Salesforce Modern Starter Pack

_Leia em / Read in: [English](#english) | [Português](#português)_

![Salesforce](https://img.shields.io/badge/Salesforce-00A1E0?style=for-the-badge&logo=salesforce&logoColor=white)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=for-the-badge)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)

---

## <a name="english"></a> 🇬🇧 English

A professional, opinionated boilerplate bringing **Platform Engineering principles** to the Salesforce ecosystem.

Stop wasting hours configuring linters, formatters, and CI/CD pipelines from scratch. This starter pack provides a highly optimized Developer Experience (DX) out of the box, ensuring code quality and automated validations so you can focus on writing Apex and LWCs.

### ✨ Features

-   **Zero-Config Code Quality:** `Prettier` and `ESLint` fully configured with official Salesforce rules.
-   **Ironclad Commits:** `Husky` and `Lint-Staged` act as gatekeepers, automatically formatting and validating your code _before_ every commit.
-   **CI/CD Ready:** Includes a robust GitHub Actions workflow that automatically validates code formatting and runs LWC Jest testing on every Pull Request.
-   **One-Click Environment Setup:** Run a single command (`npm run env:setup`) to automatically create a Scratch Org, push the source code, assign permission sets, import mock data, and open the browser.
-   **Tailwind CSS Ready:** Stop fighting bundlers. This template includes a pre-configured architecture to use Tailwind CSS natively inside Lightning Web Components via Static Resources.

### 🚀 Getting Started

1. **Use this Template:** Click the green **"Use this template"** button to create your own project.
2. **Clone and Install:**

```bash
git clone [https://github.com/YOUR_USERNAME/your-new-repo-name.git](https://github.com/YOUR_USERNAME/your-new-repo-name.git)
cd your-new-repo-name
npm install
```
