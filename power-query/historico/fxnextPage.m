// Função histórica adaptada: null representa o fim da paginação.
(vidOffset as text) as nullable text =>
let
    Resposta = fxnexDados(vidOffset),
    ProximoDeslocamento =
        if Resposta[#"has-more"] then
            Text.From(Resposta[#"vid-offset"])
        else
            null
in
    ProximoDeslocamento
