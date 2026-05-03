const { execSync } = require('child_process');

console.log('🚀 Iniciando a configuração do ambiente Salesforce...');

try {
    console.log('\n⏳ 1/6: Criando a Scratch Org (isso pode levar alguns minutos)...');
    // Cria a org, define como padrão (-d) e expira em 30 dias (-y 30)
    execSync(
        'sf org create scratch -f config/project-scratch-def.json -a ModernStarterOrg -d -y 30',
        { stdio: 'inherit' }
    );

    console.log('\n📦 2/6: Fazendo o deploy do código...');
    execSync('sf project deploy start', { stdio: 'inherit' });

    console.log('\n🔐 3/6: Atribuindo permissões...');
    execSync('sf org assign permset -n ModernStarterPerms', { stdio: 'inherit' });

    console.log('\n📂 4/6: Importando dados de teste...');
    execSync('sf data import tree -f data/accounts.json', { stdio: 'inherit' });

    console.log('\n🌐 5/6: Gerando senha de acesso...');
    execSync('sf org generate password', { stdio: 'inherit' });

    console.log('\n✅ 6/6: Ambiente configurado com sucesso! Abrindo a org...');
    execSync('sf org open', { stdio: 'inherit' });
} catch (error) {
    console.error('\n❌ Ocorreu um erro durante a configuração. Verifique os logs acima.');
    process.exit(1);
}
