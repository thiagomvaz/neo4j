LOAD CSV WITH HEADERS FROM 'https://github.com/elizarp/public/raw/refs/heads/master/health/socios_pf.csv' as row

MERGE (prestador:Prestador {prestadorCodigo:row.CODIGO})

MERGE (pf:PessoaFisica {documento:row.DOCUMENTO})
ON CREATE SET
    pf.nome = row.NOME

MERGE (pf)-[:EH_PRESTADOR]->(prestador)

MERGE (cep:CEP {cep:row.CEP})
MERGE (prestador)-[:ATENDE_EM]->(cep)