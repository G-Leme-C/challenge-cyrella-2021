# PosicaoFinanceira:
	Obra - Dados que vem do sap. Obra pode ser a mesma coisa que empreendimentos.(algumas tabelas pode ser empreendimentos)
	Marca - Item registrado manualmente (Dados que possuem origem no Asccess). Os dados mesclados no Power BI.
	Unidade - Apartamento
	Empresa - Agrupamento das SPE. (1 empresa para N obras. (marca living))
	Chave - A chave é composta por: Empreendimento, bloco e unidade.
	Bloco é o agrupamento dos apartamentos.
	SituacaoUnidade: Q - quitada (já quitou todas as pendencias financeiras)
		               VD - vendida (cliente assinou contrato)
	-> ValorVenda = VGV (Valor esperado) potencial. Quantidade de unidades vendidas.
	-> DataLiberacaoChaves - Liberando o empreendimento para começar entregar a chave.
	FormaPagamento - Dados registrados como ids que basicamente significam: Quitação a vista, financiamento bancário, alienação fiduciária(dar imóvel como garantia), securitização (clientes bons pagadores é vendido para securitizadora)
	FaseIncorporacao - flag 0 não e 1 sim
	DataCessao - Cliente quer vender imóvel que ainda está sendo lançado (ainda na planta) para terceiro. Venda de cedente para cessionário.
	DataDesembolso - Recurso(1 pagamento do contrato com o SAP do cliente para Cyrela) do cliente entra para a Cyrela.(sap cria contrato e cliente vai pagando). Linha por unidade
	-> StatusDistrato - 1 (sim) 0 (não)
	DataChaves - Quando cliente pegou a chave de fato
	IndicePreChaves E IndicePosChaves: Custos construção civil - pre entrega do empreendimento. (índices do mercado financeiro)
	-> SaldoDevedor - Tudo que a empresa tem para receber do cliente e o que está atrasado. Cenário onde temos o financiamento. O que o cliente ainda tem para pagar. (soma de total a receber e atrasados)
	Valor corrigido - multa e juros.
	-> TotalAtraso - Soma de todo saldo atrasado
	CRM_ProcessamentoPendente - falg (Identificação para o CRM se a base está atualizada)
	CRM_Operacao - controle do CRM
	CRM_PosicaoFinanceiraId - geração id automático tabela
	CreatedOn - controle CRM na base intermediaria na tabela
	ModifiedOn - controle CRM na base intermediaria na tabela
	-> ValorPago - Valor recebido pela Cyrela (pode deixar sem ser negativo na base)
	* ValorPagoAtualizado - Valor sobre os índices financeiros
	* TipoPagamento - Acampamento do pagamento. NULL = securitização não entra no CRM mas entra no SAP
	-> DataQuitacao - cliente quitou o saldo
	-> ValorQuitacao - valor paga da última prestação
	CRM_ProcessamentoPendenteRepasse - Controle de CRM de repasse

# Tabela de parcelas:
	Fluxo financeiro do cliente
	Cada linha é uma parcela, estipular os valores do encargo, separando por atributos com base no saldo devedor.
	Situação da unidade de forma detalhada.
	Os dados são bem complexos de entender mesmo, mas mandei aqui para vocês alguns pontos levantados em uma reunião com o pessoal da Cyrela que tive ontem para tentar ajudar vocês a compreender melhor os dados do negócio. As demais tabelas acredito que estão mais fáceis para a identificação do negócio. Se preocupem mais no processo desse trabalho de ETL e OLAP, 
	os dados podem ser ajustados da melhor forma para vocês trabalharem (claro que respeitando a ação original do dado).





-------------------------------------

# Insights (tirado da live)
- Cyrella está em uma fase de análise de relacionamento com o cliente, 
		devido ao crescimento da linha Vivaz (Baixo padrão).
- Entender como o cliente se relaciona e utiliza as plataformas.
- Analisar e descobrir os clientes para os quais é possível vender algo além do imóvel. (Up sell)
- Ao analisar o comportamento dos clientes, perceberam que existem clientes que compram Vivaz como investimento.
- Análise de comportamento e interação via redes sociais.
- Potencial de venda por região, baseando-se no VGV por região.

Como o cliente está se relacionando conosco?
Como o cliente está navegando pelo portal?
Como podemos melhorar o valor de venda (ofertar serviços como seguros, reparos, reforma)
Como agregar serviços no pós-compra? Como aproveitar a jornada longa que a Cyrella tem com o cliente.
Problemas para lidar com o volume de clientes devido ao crescimento da linha Vivaz.


--------------------------------------
# Indicadores

## Mateus
- Potencial de venda por região
	 - Interesse por estado/cidade/bairro

## Lucas
- Analisar e descobrir os clientes para os quais é possível vender algo além do imóvel. (Up sell) => 
	Clientes bom pagadores (Sem inadimplência), Que fizeram a compra recentemente ao lançamento do imóvel, 
	Que fizeram a compra a um certo tempo (4 anos?)

## Gabriel e Artur
- Como a pandemia afetou a Cyrella
	 - Tentar identificar exodo para regiões periféricas (não temos essas informações sobre as unidades)
	 - Verificar se afetou positivamente ou negativamente (não existem registros de venda após 2018)
	 - Verificar se existe relação entre inadimplência e a pandemia (Na tabela de parcelas só existem registros até fevereiro/2020)

## Alex
- Analisar tempo médio de quitação de um imóvel financiado.

--------------------------------------------
select ano, mes, sum(valorvenda)
from
(select 
DATE_PART('day', datavenda) dia, 
DATE_PART('month', datavenda) mes, 
DATE_PART('year', datavenda) ano, 
valorvenda 
from posicao_financeira_oltp 
where NOT datavenda IS NULL AND NOT valorvenda IS NULL) as vendasportempo
group by 1, 2


CREATE TABLE venda_por_tempo_dim(
	ano varchar,
	mes varchar,
	dia varchar,
	valor decimal
);

COPY (select DATE_PART('day', datavenda) dia, DATE_PART('month', datavenda) mes, DATE_PART('year', datavenda) ano, valorvenda from posicao_financeira_oltp where NOT datavenda IS NULL AND NOT valorvenda IS NULL)
TO venda_por_tempo_dim(dia, mes, ano, valor)

INSERT INTO venda_por_tempo_dim(dia, mes, ano, valor)
select DATE_PART('day', datavenda) dia, DATE_PART('month', datavenda) mes, DATE_PART('year', datavenda) ano, valorvenda from posicao_financeira_oltp where NOT datavenda IS NULL AND NOT valorvenda IS NULL


-------------------------------------------------
### Updates para mover dados para datas mais recentes

Tabela parcela_oltp:
	update parcela_oltp set datavencimento = datavencimento + interval '1 year', vencimentojm = vencimentojm + interval '1 year';


Tabela posicao_financeira_oltp:
	update posicao_financeira_oltp
	set
	datavenda = datavenda + interval '1 year',
	datadesembolso = datadesembolso + interval '1 year',
	datadntregainicial = datadntregainicial + interval '1 year',
	datachaves = datachaves + interval '1 year',
	dataprevisaoentrega = dataprevisaoentrega + interval '1 year',
	dataquitacao = dataquitacao + interval '1 year',
	lr_datavencimento = lr_datavencimento + interval '1 year',
	lr_datarenegociacao = lr_datarenegociacao + interval '1 year',
	dataultimaprestacaopaga = dataultimaprestacaopaga + interval '1 year'