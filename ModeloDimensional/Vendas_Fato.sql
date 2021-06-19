CREATE TABLE vendas_fato(
	sk_vendas_fato SERIAL,
	obra varchar, 
	bloco varchar, 
	unidade varchar, 
	empresa varchar,
	datavenda timestamp,
	valorvenda decimal,
	situacaounidade varchar,
	valoratraso decimal,
	totalatraso decimal,
	valorpago decimal,
	valorpagoatualizado decimal,
	tipopagamento varchar,
	valorquitacao decimal
)

INSERT INTO 
vendas_fato(obra, bloco, unidade, empresa, datavenda, valorvenda, situacaounidade, valoratraso, totalatraso, valorpago, valorpagoatualizado, tipopagamento, valorquitacao)
(select
obra, bloco, unidade, empresa,
datavenda,
valorvenda,
situacaounidade,
valoratraso,
totalatraso,
valorpago,
valorpagoatualizado,
tipopagamento,
valorquitacao
from posicao_financeira_oltp
where
NOT datavenda IS NULL AND
NOT valorvenda IS NULL AND
NOT obra IS NULL AND
NOT bloco IS NULL AND
NOT unidade IS NULL AND
NOT empresa IS NULL);


CREATE TABLE obra_local_dim(
	obra varchar,
	latitude varchar,
	longitude varchar
);

delete from obra_local_dim;
INSERT INTO obra_local_dim(obra, latitude, longitude) VALUES
('174', '-23.54953934216543', '-46.64759098344653'),
('67', '-23.478625219210546', '-46.63944592468288'),
('176', '-23.538918185968594', '-46.640545518700876'),
('12', '-23.579493391000725', '-46.615490864920524'),
('135', '-23.57695809399564', '-46.57049466272976'),
('57', '-23.515937788658942', '-46.563375087149325'),
('177', '-23.547097100570646', '-46.68536613859396'),
('175', '-23.58124072054064', '-46.64878922673077'),
('95', '-23.580210973715655', '-46.63578511142012'),
('91', '-23.477861156710542', '-46.66263483053425'),
('22', '-22.90663191496268', '-43.13009751217715'),
('153', '-22.8914435987972', '-43.227684736716625'),
('6', '-22.889145158214', '-43.28263847592869'),
('76', '-22.922095152440708', '-43.22670649008965'),
('151', '-22.963142591741576', '-43.265070889867296');


CREATE TABLE empresa_dim (
	empresa,
	nome_empresa
);

INSERT INTO empresa_dim(empresa, nome_empresa)
VALUES
('41', 'Empresa 1'),
('3', 'Empresa 2'),
('708', 'Empresa 3'),
('161', 'Empresa 4'),
('28', 'Empresa 5'),
('896', 'Empresa 6'),
('882', 'Empresa 7'),
('881', 'Empresa 8'),
('42', 'Empresa 9')



