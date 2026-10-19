// Reprodução didática do padrão histórico. Endpoint de lista v1 descontinuado.
// Parâmetros de texto esperados: pListaId e pTokenHubSpot.
// Nenhum valor real desses parâmetros é distribuído.
(vidOffset as text) as record =>
let
    Resposta = Json.Document(
        Web.Contents(
            "https://api.hubapi.com",
            [
                RelativePath = "contacts/v1/lists/" & pListaId & "/contacts/all",
                Query = [
                    count = "100",
                    propertyMode = "value_and_history",
                    vidOffset = vidOffset
                ],
                Headers = [
                    Authorization = "Bearer " & pTokenHubSpot
                ]
            ]
        )
    )
in
    Resposta
