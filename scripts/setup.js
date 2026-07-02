const { execFileSync } = require('child_process');

const scratchOrgAlias = process.env.SCRATCH_ORG_ALIAS || 'ModernStarterOrg';
const scratchOrgDuration = process.env.SCRATCH_ORG_DURATION || '30';

function runSf(args) {
    console.log(`\n$ sf ${args.join(' ')}`);
    execFileSync('sf', args, { stdio: 'inherit' });
}

console.log('🚀 Iniciando a configuração do ambiente Salesforce...');

try {
    console.log('\n⏳ 1/6: Criando a Scratch Org (isso pode levar alguns minutos)...');
    runSf([
        'org',
        'create',
        'scratch',
        '--definition-file',
        'config/project-scratch-def.json',
        '--alias',
        scratchOrgAlias,
        '--set-default',
        '--duration-days',
        scratchOrgDuration
    ]);

    console.log('\n📦 2/6: Fazendo o deploy do código...');
    runSf(['project', 'deploy', 'start']);

    console.log('\n🔐 3/6: Atribuindo permissões...');
    runSf(['org', 'assign', 'permset', '--name', 'ModernStarterPerms']);

    console.log('\n📂 4/6: Importando dados de teste...');
    runSf(['data', 'import', 'tree', '--files', 'data/accounts.json']);

    console.log('\n🧪 5/6: Executando testes Apex...');
    runSf([
        'apex',
        'run',
        'test',
        '--test-level',
        'RunLocalTests',
        '--result-format',
        'human',
        '--wait',
        '10'
    ]);

    console.log('\n✅ 6/6: Ambiente configurado com sucesso!');
    if (process.env.SKIP_ORG_OPEN === 'true') {
        console.log('SKIP_ORG_OPEN=true definido. A org nao sera aberta automaticamente.');
    } else {
        console.log('Abrindo a org...');
        runSf(['org', 'open']);
    }
} catch (error) {
    console.error('\n❌ Ocorreu um erro durante a configuração. Verifique os logs acima.');
    process.exit(1);
}
