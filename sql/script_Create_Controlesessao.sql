CREATE TABLE controle_sessao_oltp (
    id bigint NOT NULL,
    dataAcesso timestamp NOT NULL,
    hash varchar(256) NOT NULL,
    dataExpiracao timestamp NOT NULL,
    cliente varchar(18) NOT NULL,
    tipoAcesso int NOT NULL,
    loginatendente varchar(100) NULL,
    tiposessao int NULL,
    origem int NULL
)


COPY controle_sessao_oltp(id, dataAcesso, hash, dataExpiracao, cliente, tipoAcesso, loginatendente, tiposessao, origem) 
FROM '../DadosCSV/Dados_Tabela_Controlesessao.csv' 
WITH DELIMITER ';' NULL as 'NULL'