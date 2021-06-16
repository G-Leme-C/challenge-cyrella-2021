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
)

COPY posicao_financeira_oltp(obra, bloco, unidade, empresa, situacaounidade, datavenda, valorvenda, dataliberacaochaves, formapagamento, faseincorporacao, datacessao, datadesembolso, datadntregainicial, datahabitese, statusdistrato, datachaves, indiceprechaves, indiceposchaves, debitoautomatico, saldodevedor, diasatraso, valoratraso, totalatraso, crm_processamentopendente, crm_operacao, crm_posicaofinanceiraid, createdon, modifiedon, dataprevisaoentrega, valorpago, valorpagoatualizado, tipopagamento, dataquitacao, Valorquitacao, lr_tipocontrato, lr_saldo, lr_dataVencimento, lr_codigo, lr_datarenegociacao, pcvf_saldodevedor, pcvf_totalatraso, pcvu_saldodevedor, pcvu_totalatraso, PCVP_saldodevedor, PCVP_totalatraso, dec_saldodevedor, dec_totalatraso, mod_saldodevedor, mod_totalatraso, lig_saldodevedor, lig_totalatraso, tcs_saldodevedor, tcs_totalatraso, lot_saldodevedor, lot_totalatraso, crm_processamentopendenterepasse, valortotalreceberobras, valorparcelachaves, valortotalposobra, dataultimaprestacaopaga, dataultimaalteracao) 
FROM '../DadosCSV/Dados_Tabela_PosicaoFinanceira.csv' 
WITH DELIMITER ';' NULL as 'NULL'