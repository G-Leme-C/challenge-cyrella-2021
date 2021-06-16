CREATE TABLE regiao_interesse (
	id int NOT NULL,
	idade int(2) NOT NULL,
	empresa varchar(150) NOT NULL,
	orcamento dec(6) NOT NULL,
	nome varchar(150) NOT NULL,
	coordenadas dec(20,20) NOT NULL,
	regiao_interesse varchar(150) NOT NULL,
	tipo_localizacao varchar(150) NOT NULL,
	createdon timestamp NULL,
	modifiedon timestamp NULL,
	ativo bit NULL,
	codclientesap varchar(10) NULL
)

COPY regiao_interesse(id, idade, empresa, orcamento, nome, coordenadas, regiao_interesse, tipo_localizacao, createdon, modifiedon, ativo, codclientesap) 
FROM '../DadosCSV/Dados_Tabela_Regiao_Interesse.csv' WITH DELIMITER ','