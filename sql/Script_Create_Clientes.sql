CREATE TABLE coobrigado_oltp (
	id int NOT NULL,
	obra char(4) NOT NULL,
	bloco char(2) NOT NULL,
	unidade char(6) NOT NULL,
	nome varchar(150) NOT NULL,
	cpf_cnpj varchar(20) NOT NULL,
	percentualparticipacao decimal(5, 2) NOT NULL,
	principal bit NOT NULL,
	createdon timestamp NULL,
	modifiedon timestamp NULL,
	ativo bit NULL,
	codclientesap varchar(10) NULL
)

COPY coobrigado_oltp(id, obra, bloco, unidade, nome, cpf_cnpj, percentualparticipacao, principal, createdon, modifiedon, ativo, codclientesap) 
FROM '../DadosCSV/Dados_Tabela_Clientes.csv' WITH DELIMITER ';'