module Route exposing (..)

import Debug exposing (log)
import Url exposing (Url)
import Url.Parser as Parser exposing (Parser, (</>), int, map, oneOf, s, string)
import Html exposing (Attribute)
import Html.Attributes as Attr

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
fromUrl =
    Parser.parse parser


href : Route -> Attribute msg
href targetRoute =
    Attr.href (routeToString targetRoute)


routeToString : Route -> String
routeToString page =
    String.join "/" (routeToPieces page)


routeToPieces : Route -> List String
routeToPieces page =
    case page of
        Home ->
            []

        AddContent ->
            [ "add_content" ]