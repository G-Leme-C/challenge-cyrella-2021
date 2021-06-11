CREATE TABLE log_navegacao_oltp(
	id bigint NOT NULL,
	documentocliente varchar(18) NOT NULL,
	dataevento timestamp NOT NULL,
	tipoevento int NOT NULL,
	tipoacesso int NOT NULL,
	idatendente varchar NULL,
	pagina varchar(50) NOT NULL,
	atividade varchar(255) NOT NULL,
	logerro varchar(500) NULL,
	origem int NULL
)

COPY log_navegacao_oltp(id, documentocliente, dataevento, tipoevento, tipoacesso, idatendente, pagina, atividade, logerro, origem) 
FROM 'C:\Gabriel\FIAP\2021\Fase4\Challenge\02_Dados\Dados_Tabela_LogNavegacao.csv' 
WITH DELIMITER ';' NULL as 'NULL'