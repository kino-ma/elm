module Route exposing (..)

import Url exposing (Url)
import Url.Parser as Parser exposing (Parser, (</>), int, map, oneOf, s, string)

type Route 
    = Home
    | AddContent


parser : Parser (Route -> a) a
parser =
    oneOf
        [ Parser.map Home Parser.top
        , Parser.map AddContent (s "add_content")
        ]


fromUrl : Url -> Maybe Route
fromUrl url =
    { url | path = Maybe.withDefault "" url.fragment, fragment = Nothing }
        |> Parser.parse parser