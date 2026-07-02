module.exports = {
    env: {
        browser: true,
        es2021: true,
        node: true
    },
    ignorePatterns: ['node_modules/**', 'force-app/main/default/staticresources/**'],
    parserOptions: {
        ecmaVersion: 'latest',
        sourceType: 'module'
    },
    rules: {
        'no-unused-vars': ['warn', { argsIgnorePattern: '^_' }],
        'no-console': 'off'
    }
};
