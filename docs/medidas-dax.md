# Medidas DAX do funil

Seleção de nove medidas extraídas da tabela Medidas Base. Os nomes foram mantidos, inclusive a grafia original, para rastreabilidade. Seus nomes aparecem nas definições JSON do relatório; isso não comprova que todas compõem especificamente a tela de abertura.

O código está em [dax/medidas-funil.dax](../dax/medidas-funil.dax). O identificador de pipeline foi substituído por "<ID_PIPELINE>"; as expressões foram preservadas, salvo indentação e remoção de delimitadores do formato TMDL.

| Medida | Regra observada |
| --- | --- |
| LEADS | Contatos distintos com envio de formulário preenchido e Validação igual a Não |
| MQL | Contatos distintos com data de MQL preenchida, usando essa data no calendário |
| SQL | Contatos distintos com data de SQL preenchida, usando essa data no calendário |
| Qtd Diagnósitcos Agendados | Negócios distintos do pipeline selecionado, usando a data de criação no calendário |
| Qtd Diagnosticos Realizados | Negócios distintos do pipeline com data de diagnóstico preenchida, usando essa data no calendário |
| Qtd Propostas apresentadas | Negócios distintos do pipeline com data de apresentação preenchida, usando essa data no calendário |
| Qtd Aceite Formal | Negócios distintos do pipeline com data de aceite preenchida, usando essa data no calendário |
| Qtd Contrato Fech. | Negócios distintos do pipeline com data de assinatura preenchida, usando essa data no calendário |
| Qtd_Motivo de Perda total | Recalcula LEADS para o destino Lead perdido |

## Como ler o código

- CALCULATE: avalia um cálculo sob determinados filtros.
- DISTINCTCOUNT: conta valores distintos; valores em branco também podem participar da contagem.
- USERELATIONSHIP: utiliza um relacionamento existente durante o cálculo; não cria um relacionamento novo.
- BLANK(): representa um valor em branco.
- + 0: faz o resultado aparecer como zero em vez de branco em expressões numéricas como estas.

## Cuidados ao interpretar

A medida de diagnósticos agendados selecionada usa criação do negócio, e não uma condição explícita de data de agendamento. Essa é a regra encontrada no código; sua equivalência com o processo comercial precisa de confirmação.

MQL e SQL usam datas de qualificação. Propostas e contratos usam as datas dos respectivos eventos. Comparar os totais por período exige considerar a diferença de datas e o contexto de filtros do modelo.

O significado de Validação igual a Não depende da transformação que gerou essa coluna. Não foi inferido um critério comercial além do filtro observado.

## Como validar no Power BI

As expressões exigem as tabelas, colunas e relacionamentos referenciados. No modelo adequado, configure o pipeline, selecione um período conhecido e confira as contagens com as entidades de origem. Compare as datas e filtros de cada etapa. Nesta edição houve conferência textual; os cálculos não foram executados no Power BI Desktop.
