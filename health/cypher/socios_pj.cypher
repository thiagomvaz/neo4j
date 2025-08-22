LOAD CSV WITH HEADERS FROM 'https://github.com/elizarp/public/raw/refs/heads/master/health/socios_pj.csv' as row

MATCH (socio:PessoaFisica {documento:row.CPF_SOCIO})

MERGE (pj:PessoaJuridica {documento:row.DOCUMENTO})

MERGE (prestador:Prestador {prestadorCodigo:row.CODIGO})

MERGE (pj)-[:EH_PRESTADOR]->(prestador)

MERGE (socio)-[:SOCIO_DE]->(pj)

MERGE (cep:CEP {cep:row.CEP})
MERGE (prestador)-[:ATENDE_EM]->(cep)