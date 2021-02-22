module Main exposing (..)
import Browser
import Html exposing (..)
import Html.Attributes exposing (href, rel, src, style)
import Css exposing (..)
import Html.Events exposing (onClick)


main = 
    Browser.document
    { init = init
    , subscriptions = subs
    , update = update
    , view = view
    }



type alias Model = 
    { showHumburger : Bool
    }

init : () -> (Model, Cmd Msg)
init _ =
    ( Model False
    , Cmd.none
    )


subs _ = Sub.none


type Msg = 
    ShowHumburger

update : Msg -> Model -> (Model, Cmd Msg)
update _ model =
    ( {model | showHumburger = not model.showHumburger }
    , Cmd.none)


type alias Document msg = 
    { title : String
    , body : List (Html msg)
    }

view : Model -> Document Msg
view model =
    Document "Welcome to kino.ma"
    [ header [class Style "page-header-container"]
        [ img [src "https://www.kino.ma/favicon.ico", class Style "page-header-icon" ]  []
        , div [class Style "page-header-child" ] [ text "hoge" ]
        , fakeLink [onClick ShowHumburger] [text "this is humburger"]
        , humburger [] model.showHumburger
        ]
    , div [class Style "root" ]
        [ h1 [ class Style "header" ] [ text "Welcome to kino.ma" ]
        , div []
            [ p [] [ text "Hello, this is kino.ma home page." ]
            ]
        , div [class Style "container"]
            [ aChild "https://twitter.kino.ma" [] "Twitter"
            , aChild "https://mastodon.kino.ma/@makino" [rel "me"] "Mastodon" 
            , aChild "https://github.com/kino-ma" [] "GitHub"
            ]
        , div []
            [ a [ href "https://github.com/kino-ma/www.kino.ma" ] [ text "page source" ]
            ]
        ]
    ]


aChild : String -> List (Attribute msg) -> String -> Html msg
aChild link atrs content =
    a (atrs ++ [class Style "child", class Style "content",  href link ]) [ text content ]


humburger : List (Attribute msg) -> Bool -> Html msg
humburger atrs show = 
    div
        (atrs ++ [ class Style "humburger", style "display" (if show then "block" else "none") ])
        [ i [ plainClass "fa", plainClass "fa-bars" ] [text "humburger"]
        ]

fakeLink : List (Attribute msg) -> List (Html msg) -> Html msg
fakeLink atrs elem =
    span (atrs ++
        [ style "color" "blue"
        , style "text-decoration" "underline"
        , style "cursor" "pointer"
        ])
        <| elem