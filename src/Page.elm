module Page exposing (..)

import Html exposing (..)
import Html.Attributes exposing (href, style, src)
import Browser exposing (Document)

import Css exposing (..)
import Session exposing (..)


type Page
    = Home
    | AddContent
    | Other


view : Page -> { title : String, content : Html msg } -> Document msg
view page { title, content } =
    { title = title
    , body = [ viewHeader, content, viewFooter ]
    }

viewHeader : Html msg
viewHeader =
    header
        [ class Style "page-header-container" ]
        [ img [src "https://www.kino.ma/favicon.ico", class Style "page-header-icon" ]  []
        , div [class Style "page-header-child" ] [ text "hoge" ]
        , fakeLink [] [ text "this is humburger" ]
        , hiddenMenu [] True
        ]


hiddenMenu : List (Attribute msg) -> Bool -> Html msg
hiddenMenu atrs show = 
    div
        (atrs ++ [ class Style "hidden-menu", style "display" (if show then "block" else "none") ])
        [ a [ href "/add_content" ] [text "add_content"]
        ]

fakeLink : List (Attribute msg) -> List (Html msg) -> Html msg
fakeLink atrs elem =
    span (atrs ++
        [ style "color" "blue"
        , style "text-decoration" "underline"
        , style "cursor" "pointer"
        ])
        <| elem
        

viewFooter : Html msg
viewFooter = 
    footer
        [ class Style "page-footer-container" ]
        [ small [] [ text "footer" ] ]