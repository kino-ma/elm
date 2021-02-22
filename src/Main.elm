module Main exposing (..)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (href, style, rel, src)
import Url
import Url.Parser exposing (Parser, (</>), int, map, oneOf, s, string)

import Css exposing (..)


main : Program () Model Msg
main = 
    Browser.application
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    , onUrlChange = UrlChanged
    , onUrlRequest = LinkClicked
    }



type alias Model = 
    { showHumburger : Bool
    , key : Nav.Key
    , url : Url.Url
    }

init : () -> Url.Url -> Nav.Key -> (Model, Cmd Msg)
init flags url key =
    ( Model False key url
    , Cmd.none
    )


type Msg
    = ShowHumburger
    | LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        ShowHumburger ->
            ( {model | showHumburger = not model.showHumburger }
            , Cmd.none)
        LinkClicked urlRequest -> 
            case urlRequest of
                Browser.Internal url ->
                    (model, Nav.pushUrl model.key (Url.toString url))

                Browser.External href ->
                    (model, Nav.load href)

        UrlChanged url ->
            ( { model | url = url }
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


type alias Document msg = 
    { title : String
    , body : List (Html msg)
    }

view : Model -> Document Msg
view model =
    { title = "Welcome to kino.ma"
    , body = 
        [ header [class Style "page-header-container"]
            [ img [src "https://www.kino.ma/favicon.ico", class Style "page-header-icon" ]  []
            , div [class Style "page-header-child" ] [ text "hoge" ]
            , fakeLink [onClick ShowHumburger] [text "this is humburger"]
            , hiddenMenu [] model.showHumburger
            ]
        , div [class Style "root" ]
            [ h1 [ class Style "header" ] [ text "Welcome to kino.ma" ]
            , div []
                [ p [] [ text "Hello, this is kino.ma home page." ]
                , p [] [ text <| "You're now at " ++ (Url.toString model.url) ]
                ]
            , div [class Style "container"]
                [ aChild "https://twitter.kino.ma" [] "Twitter"
                , aChild "https://mastodon.kino.ma/@makino" [rel "me"] "Mastodon" 
                , aChild "https://github.com/kino-ma" [] "GitHub"
                , aChild "/hoge" [] "/hoge"
                ]
            , div []
                [ a [ href "https://github.com/kino-ma/www.kino.ma" ] [ text "page source" ]
                ]
            ]
        ]
    }


aChild : String -> List (Attribute msg) -> String -> Html msg
aChild link atrs content =
    a (atrs ++ [class Style "child", class Style "content",  href link ]) [ text content ]


hiddenMenu : List (Attribute msg) -> Bool -> Html msg
hiddenMenu atrs show = 
    div
        (atrs ++ [ class Style "hidden-menu", style "display" (if show then "block" else "none") ])
        [ a [ href "/add_content.html" ] [text "add_content"]
        ]

fakeLink : List (Attribute msg) -> List (Html msg) -> Html msg
fakeLink atrs elem =
    span (atrs ++
        [ style "color" "blue"
        , style "text-decoration" "underline"
        , style "cursor" "pointer"
        ])
        <| elem