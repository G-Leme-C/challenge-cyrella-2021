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
)


COPY parcela_oltp(obra, bloco, unidade, id_contrato_vencimento, contrato, datavencimento, valorprestacao, principal, jurostp, variacoes, seguros, descontos, multa, jurosmora, prorataindice, proratacontrato, valorpresente, indicereajuste, situacaoparcela, boletojm, vencimentojm, periodicidade, tipocontrato, tipoemprestimo, tipobloqueio, crm_processamentopendente, crm_operacao, crm_parcelaid, createdon, modifiedon, geradopor, idreneg, datarenegociacao, valorabono, valoracrescimo, vlrabonomulta, vlrabonojuros, vlrabonoprorata, tx_juros, tx_encargos, motivorenegociacao) 
FROM 'C:\Gabriel\FIAP\2021\Fase4\Challenge\02_Dados\Dados_Tabela_Parcelas.csv' 
WITH DELIMITER ';' NULL as 'NULL'
