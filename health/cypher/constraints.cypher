CREATE CONSTRAINT constraint_prestador IF NOT EXISTS FOR (c:Prestador) REQUIRE (c.prestadorCodigo) IS NODE KEY;
CREATE CONSTRAINT constraint_guia IF NOT EXISTS FOR (c:Guia) REQUIRE (c.guiaNumero) IS NODE KEY;
CREATE CONSTRAINT constraint_beneficiario IF NOT EXISTS FOR (c:Beneficiario) REQUIRE (c.beneficiarioCarteira) IS NODE KEY;
CREATE CONSTRAINT constraint_procedimento IF NOT EXISTS FOR (c:Procedimento) REQUIRE (c.procedimentoCodigo) IS NODE KEY;
CREATE CONSTRAINT constraint_pessoafisica IF NOT EXISTS FOR (c:PessoaFisica) REQUIRE (c.documento) IS NODE KEY;
CREATE CONSTRAINT constraint_pessoajuridica IF NOT EXISTS FOR (c:PessoaJuridica) REQUIRE (c.documento) IS NODE KEY;
CREATE CONSTRAINT constraint_cep IF NOT EXISTS FOR (c:CEP) REQUIRE (c.cep) IS NODE KEY;
CREATE CONSTRAINT constraint_data IF NOT EXISTS FOR (c:Data) REQUIRE (c.data) IS NODE KEY;