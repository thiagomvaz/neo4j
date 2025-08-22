LOAD CSV WITH HEADERS FROM 'https://github.com/elizarp/public/raw/refs/heads/master/health/guias.zip' as row

CALL (row){
    MERGE (guia:Guia {guiaNumero:row.NUMERO_GUIA_PRESTADOR})
    SET
        guia.guiaData = row.DATA_SOLICITACAO

    MERGE (beneficiario:Beneficiario {beneficiarioCarteira:row.NUMERO_CARTEIRA})

    MERGE (pf:PessoaFisica {documento:row.DOCUMENTO_BENEFICIARIO})
    ON CREATE SET
        pf.nome = row.NOME

    MERGE (solicitante:Prestador {prestadorCodigo:row.CODIGO_SOLICITANTE})
    SET
        solicitante.prestadorNome = row.NOME_SOLICITANTE

    MERGE (executante:Prestador {prestadorCodigo:row.CODIGO_EXECUTANTE})
    SET
        executante.prestadorNome = row.NOME_EXECUTANTE

    MERGE (procedimento:Procedimento {procedimentoCodigo:row.CODIGO_PROCEDIMENTO})
    SET
        procedimento.procedimentoTabela = row.CODIGO_TABELA,
        procedimento.procedimentoNome = row.DESCRICAO_PROCEDIMENTO

    MERGE (data:Data {data:row.DATA_SOLICITACAO})

    MERGE (beneficiario)-[:TEM_GUIA]->(guia)
    MERGE (pf)-[:EH_BENEFICIARIO]->(beneficiario)

    MERGE (guia)-[r:CONTEM_PROCEDIMENTO]->(procedimento)
    SET r.quantidadeSolicitada = row.QUANTIDADE_SOLICITADA

    MERGE (guia)-[:SOLICITADA_POR]->(solicitante)
    MERGE (guia)-[:EXECUTADA_POR]->(executante)
    MERGE (guia)-[:SOLICITADA_EM]->(data)

} IN TRANSACTIONS OF 1000 ROWS