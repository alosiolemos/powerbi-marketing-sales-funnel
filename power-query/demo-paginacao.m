// Consulta demonstrativa: crie antes uma consulta chamada fxPaginarContatos.
// Usa somente dados fictícios em memória, sem API ou autenticação.
let
    PaginasFicticias = [
        #"0" = [
            contacts = {[id = 1, nome = "Contato A"], [id = 2, nome = "Contato B"]},
            #"has-more" = true,
            #"vid-offset" = "2"
        ],
        #"2" = [
            contacts = {[id = 3, nome = "Contato C"], [id = 4, nome = "Contato D"]},
            #"has-more" = true,
            #"vid-offset" = "4"
        ],
        #"4" = [
            contacts = {[id = 5, nome = "Contato E"]},
            #"has-more" = false,
            #"vid-offset" = null
        ]
    ],
    ObterPaginaFicticia = (Deslocamento as text) as record =>
        Record.Field(PaginasFicticias, Deslocamento),
    Contatos = fxPaginarContatos(ObterPaginaFicticia, "0"),
    Resultado = Table.FromRecords(Contatos)
in
    Resultado
