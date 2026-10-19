# Integração histórica com HubSpot

## Entrada → processamento → saída

- Entrada: endpoint de contatos, identificador de lista, propriedades solicitadas, deslocamento e autenticação.
- Processamento: requisições HTTP, leitura de JSON, geração de deslocamentos e obtenção das páginas.
- Saída intermediária: respostas JSON que alimentam as transformações do modelo.

## Funções apresentadas pelo autor

`fxnextPage(vidOffset)` consulta uma página e lê `has-more` e `vid-offset`. Retorna o próximo deslocamento como texto ou `"0"` para encerrar a geração.

`fxnexDados(vidOffset)` consulta o mesmo endpoint e devolve a resposta JSON para tratamento posterior.

O trecho de `Contatos` apresentado é parcial: mostra uma chamada inicial e uma lista criada com `List.Generate`, mas não a aplicação completa da função de dados nem a expansão dos contatos. Portanto, ainda não permite confirmar a completude da extração.

## Pontos a validar antes de reutilizar

- Deslocamento inicial `"1"` e possível exclusão de registros iniciais.
- Tratamento da última página: a função de paginação converte a resposta final em sentinela, e é necessário conferir como a função de dados consome a lista.
- A variável `Inicio` não aparece sendo utilizada no trecho enviado; verificar a consulta completa.
- Possíveis chamadas repetidas: a descoberta do próximo deslocamento e a obtenção dos dados consultam o mesmo recurso.
- Respostas de erro, limites de requisições, tentativas e condição de parada.
- Construção dos parâmetros e configuração segura da autenticação.
- Compatibilidade atual da API histórica antes de uma reconexão.

Esses itens são pontos de revisão, não falhas confirmadas no projeto completo.

## Paginação e atualização incremental

Paginação divide uma consulta em várias páginas. Atualização incremental atualiza apenas determinadas faixas de dados. O uso de `List.Generate` comprova o padrão de paginação no exemplo, mas sozinho não comprova atualização incremental.
