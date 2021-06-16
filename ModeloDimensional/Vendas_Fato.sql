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

INSERT INTO obra_local_dim VALUES
('57','-25.338020003220176','-43.73848384885855'),
('67','-24.738743868227655','-37.61597278411507'),
('176','-24.933942917457568','-54.808348616017646'),
('12','-22.278219193293044','-42.32479653162116'),
('135','-23.472636624932743','-44.695328822314465'),
('174','-28.028173743644114','-54.97533471315024'),
('177','-15.170098769208298','-48.947803978474035'),
('175','-28.3963450146662','-38.46627752894722'),
('95','-27.454581709322806','-38.54213639852945'),
('91','-19.477179112853307','-52.79045656966105'),
('22','-23.791873897441434','-35.09141690548245'),
('6','-27.072882078531553','-40.95178338619241'),
('153','-27.910674838989426','-50.73366099906593'),
('76','-22.82242604221889','-34.63863089704121'),
('151','-23.70838385603526','-47.9857207388975');