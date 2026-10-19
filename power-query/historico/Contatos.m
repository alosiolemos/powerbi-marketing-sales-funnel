// Consulta histórica adaptada. Depende de fxnextPage e fxnexDados.
// Não executar contra a API atual: o endpoint de listas v1 foi descontinuado.
let
    Deslocamentos = List.Generate(
        () => "0",
        each _ <> null,
        each fxnextPage(_)
    ),
    TabelaDeslocamentos = Table.FromList(
        Deslocamentos,
        Splitter.SplitByNothing(),
        {"Deslocamento"}
    ),
    FuncaoAplicada = Table.AddColumn(
        TabelaDeslocamentos,
        "Resposta",
        each fxnexDados([Deslocamento]),
        type record
    ),
    ListasContatos = List.Transform(
        FuncaoAplicada[Resposta],
        each Record.Field(_, "contacts")
    ),
    ContatosConsolidados = List.Combine(ListasContatos),
    Resultado = Table.FromRecords(ContatosConsolidados)
in
    Resultado
