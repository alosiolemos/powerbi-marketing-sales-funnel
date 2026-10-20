# Contexto e escopo

## Objetivo

Dar ao time de marketing uma visão da jornada dos leads e do retorno comercial, desde a geração até o fechamento, com acompanhamento de perdas e oportunidades em aberto.

## Escopo histórico

Desenvolvi o painel para acompanhar informações a partir de 2021, até sua descontinuação em 2025. Trabalhei com contatos, negócios e contatos convertidos em clientes no HubSpot.

As análises contemplavam qualificação, abordagem comercial, reuniões, diagnósticos, propostas, negociação e fechamento. Filtros permitiam observar diferenças por período, origem, fonte e segmento.

## Decisões técnicas observadas

- Funções em M para requisições HTTP e paginação.
- Modelo semântico com relações entre tabelas e calendário.
- Medidas DAX com DISTINCTCOUNT para contar valores distintos.
- USERELATIONSHIP nas medidas selecionadas para calcular etapas pela data do respectivo evento.
- Estrutura PBIP para separar definições do relatório e do modelo em arquivos.

O inventário identificou 16 diretórios de páginas, 203 declarações de medidas e 37 relacionamentos. Esses números descrevem o projeto de referência, e não a quantidade de artefatos distribuídos neste repositório.

## Limites de interpretação

As contagens por etapa podem utilizar datas distintas. Portanto, uma razão entre etapas dentro de um mês não necessariamente representa a conversão de uma mesma coorte de leads. Uma coorte é um grupo acompanhado a partir de um evento comum, como a entrada no funil.

Não foram calculados ganhos de produtividade ou aumento de receita atribuíveis ao painel. Os valores do relatório original não são utilizados como evidência pública de resultado.

## Forma de apresentação

A primeira edição prioriza documentação, código DAX selecionado e capturas revisadas. Uma demonstração com dados sintéticos poderá ser desenvolvida posteriormente.
