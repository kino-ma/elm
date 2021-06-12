module Route exposing (..)

import Url exposing (Url)
import Url.Parser as Parser exposing (Parser, (</>), int, map, oneOf, s, string)
import Html exposing (Attribute)
import Html.Attributes as Attr


type Route 
    = Home
    | AddContent
    | MovingMa
    | None


parser : Parser (Route -> a) a
parser =
    oneOf
        [ Parser.map Home Parser.top
        , Parser.map AddContent (s "add_content")
        , Parser.map MovingMa (s "moving-ma")
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
            [ "/" ]

        AddContent ->
            [ "add_content" ]

        MovingMa ->
            [ "moving-ma" ]

        None ->
            []