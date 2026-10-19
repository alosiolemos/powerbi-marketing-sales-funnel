// Exemplo didático adaptado; não contém a integração original nem chamadas de rede.
// ObterPagina recebe um deslocamento e devolve contacts, has-more e vid-offset.
(ObterPagina as function, DeslocamentoInicial as text) as list =>
let
    Paginas = List.Generate(
        () => ObterPagina(DeslocamentoInicial),
        each _ <> null,
        each
            if [#"has-more"] then
                ObterPagina(Text.From([#"vid-offset"]))
            else
                null,
        each [contacts]
    ),
    Contatos = List.Combine(Paginas)
in
    Contatos
