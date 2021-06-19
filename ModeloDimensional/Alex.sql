select  datavenda, valorvenda, dataquitacao, valorquitacao
from posicao_financeira_oltp

where not dataquitacao is null 

CREATE TABLE tempo_medio_quitacao(
datavenda timestamp,
valorvenda real,
dataquitacao timestamp,
valorquitacao real
);

INSERT INTO tempo_medio_quitacao(datavenda, valorvenda, dataquitacao, valorquitacao)
select datavenda, valorvenda, dataquitacao, valorquitacao from posicao_financeira_oltp
where not dataquitacao is null