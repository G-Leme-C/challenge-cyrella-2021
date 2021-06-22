CREATE TABLE parcela_fato (
	obra varchar,
	bloco varchar,
	unidade varchar,
	contrato varchar,
	datavencimento varchar,
	valorprestacao decimal,
	principal decimal,
	jurostp decimal,
	variacoes decimal,
	multa decimal,
	seguros decimal,
	valorpresente decimal,
	situacaoparcela varchar,
	periodicidade varchar,
	tipocontrato varchar,
	tipoemprestimo varchar
)

insert into parcela_fato
select obra, bloco, unidade, contrato, datavencimento, valorprestacao, principal, jurostp, variacoes, multa, seguros, valorpresente, situacaoparcela, periodicidade, tipocontrato, tipoemprestimo
from parcela_oltp;

