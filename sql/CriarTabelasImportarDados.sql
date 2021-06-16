-- Criar tabelas e importar dados OLTP Cyrella
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
);

COPY coobrigado_oltp(id, obra, bloco, unidade, nome, cpf_cnpj, percentualparticipacao, principal, createdon, modifiedon, ativo, codclientesap) 
FROM '../DadosCSV/Dados_Tabela_Clientes.csv' WITH DELIMITER ';';


------------------------------------


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
);

COPY controle_sessao_oltp(id, dataAcesso, hash, dataExpiracao, cliente, tipoAcesso, loginatendente, tiposessao, origem) 
FROM '../DadosCSV/Dados_Tabela_Controlesessao.csv' 
WITH DELIMITER ';' NULL as 'NULL';


------------------------------------

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
);

COPY log_navegacao_oltp(id, documentocliente, dataevento, tipoevento, tipoacesso, idatendente, pagina, atividade, logerro, origem) 
FROM '../DadosCSV/Dados_Tabela_LogNavegacao.csv' 
WITH DELIMITER ';' NULL as 'NULL';


------------------------------------


CREATE TABLE parcela_oltp (
	obra char(4) NOT NULL,
	bloco char(2) NOT NULL,
	unidade char(6) NOT NULL,
	id_contrato_vencimento varchar(50) NOT NULL,
	contrato varchar(20) NOT NULL,
	datavencimento timestamp NOT NULL,
	valorprestacao decimal(18, 2) NOT NULL,
	principal decimal(18, 2) NULL,
	jurostp decimal(18, 2) NULL,
	variacoes decimal(18, 2) NULL,
	seguros decimal(18, 2) NULL,
	descontos decimal(18, 2) NULL,
	multa decimal(18, 2) NULL,
	jurosmora decimal(18, 2) NULL,
	prorataindice decimal(18, 2) NULL,
	proratacontrato decimal(18, 2) NULL,
	valorpresente decimal(18, 2) NULL,
	indicereajuste char(10) NULL,
	situacaoparcela char(10) NULL,
	boletojm char(1) NULL,
	vencimentojm timestamp NULL,
	periodicidade varchar(50) NULL,
	tipocontrato char(3) NULL,
	tipoemprestimo char(3) NULL,
	tipobloqueio char(6) NULL,
	crm_processamentopendente bit NOT NULL,
	crm_operacao char(1) NOT NULL,
	crm_parcelaid varchar NULL,
	createdon timestamp NOT NULL,
	modifiedon timestamp NOT NULL,
	geradopor varchar(80) NULL,
	idreneg int NULL,
	datarenegociacao timestamp NULL,
	valorabono decimal(18, 2) NULL,
	valoracrescimo decimal(18, 2) NULL,
	vlrabonomulta decimal(18, 2) NULL,
	vlrabonojuros decimal(18, 2) NULL,
	vlrabonoprorata decimal(18, 2) NULL,
	tx_juros decimal(18, 2) NULL,
	tx_encargos decimal(18, 2) NULL,
	motivorenegociacao varchar(200) NULL
);


COPY parcela_oltp(obra, bloco, unidade, id_contrato_vencimento, contrato, datavencimento, valorprestacao, principal, jurostp, variacoes, seguros, descontos, multa, jurosmora, prorataindice, proratacontrato, valorpresente, indicereajuste, situacaoparcela, boletojm, vencimentojm, periodicidade, tipocontrato, tipoemprestimo, tipobloqueio, crm_processamentopendente, crm_operacao, crm_parcelaid, createdon, modifiedon, geradopor, idreneg, datarenegociacao, valorabono, valoracrescimo, vlrabonomulta, vlrabonojuros, vlrabonoprorata, tx_juros, tx_encargos, motivorenegociacao) 
FROM '../DadosCSV/Dados_Tabela_Parcelas.csv' 
WITH DELIMITER ';' NULL as 'NULL';


------------------------------------


CREATE TABLE posicao_financeira_oltp(
	obra char(4) NOT NULL,
	bloco char(2) NOT NULL,
	unidade char(6) NOT NULL,
	empresa char(4) NOT NULL,
	situacaounidade char(2) NOT NULL,
	datavenda timestamp NULL,
	valorvenda decimal(15, 2) NULL,
	dataliberacaochaves timestamp NULL,
	formapagamento int NULL,
	faseincorporacao char(3) NULL,
	datacessao timestamp NULL,
	datadesembolso timestamp NULL,
	datadntregainicial timestamp NULL,
	datahabitese timestamp NULL,
	statusdistrato char(1) NULL,
	datachaves timestamp NULL,
	indiceprechaves char(10) NULL,
	indiceposchaves char(10) NULL,
	debitoautomatico char(1) NULL,
	saldodevedor decimal(18, 2) NOT NULL,
	diasatraso int NOT NULL,
	valoratraso decimal(18, 2) NOT NULL,
	totalatraso decimal(18, 2) NOT NULL,
	crm_processamentopendente bit NOT NULL,
	crm_operacao char(1) NOT NULL,
	crm_posicaofinanceiraid varchar NULL,
	createdon timestamp NOT NULL,
	modifiedon timestamp NOT NULL,
	dataprevisaoentrega timestamp NULL,
	valorpago decimal(13, 2) NULL,
	valorpagoatualizado decimal(13, 2) NULL,
	tipopagamento char(3) NULL,
	dataquitacao timestamp NULL,
	Valorquitacao decimal(13, 2) NULL,
	lr_tipocontrato char(3) NULL,
	lr_saldo decimal(13, 2) NULL,
	lr_dataVencimento timestamp NULL,
	lr_codigo varchar(20) NULL,
	lr_datarenegociacao timestamp NULL,
	pcvf_saldodevedor decimal(13, 2) NULL,
	pcvf_totalatraso decimal(13, 2) NULL,
	pcvu_saldodevedor decimal(13, 2) NULL,
	pcvu_totalatraso decimal(13, 2) NULL,
	PCVP_saldodevedor decimal(13, 2) NULL,
	PCVP_totalatraso decimal(13, 2) NULL,
	dec_saldodevedor decimal(13, 2) NULL,
	dec_totalatraso decimal(13, 2) NULL,
	mod_saldodevedor decimal(13, 2) NULL,
	mod_totalatraso decimal(13, 2) NULL,
	lig_saldodevedor decimal(13, 2) NULL,
	lig_totalatraso decimal(13, 2) NULL,
	tcs_saldodevedor decimal(13, 2) NULL,
	tcs_totalatraso decimal(13, 2) NULL,
	lot_saldodevedor decimal(13, 2) NULL,
	lot_totalatraso decimal(13, 2) NULL,
	crm_processamentopendenterepasse bit NOT NULL,
	valortotalreceberobras decimal(15, 2) NULL,
	valorparcelachaves decimal(15, 2) NULL,
	valortotalposobra decimal(15, 2) NULL,
	dataultimaprestacaopaga timestamp NULL,
	dataultimaalteracao timestamp NULL
);

COPY posicao_financeira_oltp(obra, bloco, unidade, empresa, situacaounidade, datavenda, valorvenda, dataliberacaochaves, formapagamento, faseincorporacao, datacessao, datadesembolso, datadntregainicial, datahabitese, statusdistrato, datachaves, indiceprechaves, indiceposchaves, debitoautomatico, saldodevedor, diasatraso, valoratraso, totalatraso, crm_processamentopendente, crm_operacao, crm_posicaofinanceiraid, createdon, modifiedon, dataprevisaoentrega, valorpago, valorpagoatualizado, tipopagamento, dataquitacao, Valorquitacao, lr_tipocontrato, lr_saldo, lr_dataVencimento, lr_codigo, lr_datarenegociacao, pcvf_saldodevedor, pcvf_totalatraso, pcvu_saldodevedor, pcvu_totalatraso, PCVP_saldodevedor, PCVP_totalatraso, dec_saldodevedor, dec_totalatraso, mod_saldodevedor, mod_totalatraso, lig_saldodevedor, lig_totalatraso, tcs_saldodevedor, tcs_totalatraso, lot_saldodevedor, lot_totalatraso, crm_processamentopendenterepasse, valortotalreceberobras, valorparcelachaves, valortotalposobra, dataultimaprestacaopaga, dataultimaalteracao) 
FROM '../DadosCSV/Dados_Tabela_PosicaoFinanceira.csv' 
WITH DELIMITER ';' NULL as 'NULL';

------------------------------------------

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