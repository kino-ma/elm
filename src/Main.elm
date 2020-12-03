module Main exposing (..)

import Browser
import Html exposing (Html)
-- import Html.Attributes exposing (..)

import Element exposing (Element, Attribute, link, text, el, column, row)

import Element.Background as Background
import Element.Border as Border
import Element.Region as Region
import Element.Font as Font

import Styles

main = 
    Browser.document
        { init = init
        , subscriptions = subs
        , update = update
        , view = view
        }


type Model = 
    Nop


init : () -> (Model, Cmd Msg)
init _ =
    ( Nop
    , Cmd.none
    )


subs _ = Sub.none


type alias Msg = ()

update : Msg -> Model -> (Model, Cmd Msg)
update _ model = (model, Cmd.none)


type alias Document msg = 
    { title : String
    , body : List (Html msg)
    }

view _ =
    Document "Welcome to kino.ma" <|
        [ Element.layout [] <|
            column [] <|
                [ el [ Region.heading 1 ] <|
                    text "Welcome to kino.ma"
                , el [] <|
                    text "Hello, this is kino.ma home page."
                , row []
                    [ link []
                        { url = "https://twitter.kino.ma"
                        , label = text "Twitter"
                        }
                    , link [] -- rel "me"
                        { url = "https://mastodon.kino.ma/@makino"
                        , label = text "Mastodon"
                        }
                    , link []
                        { url = "https://github.com/kino-ma"
                        , label = text "GitHub"
                        }
                    ]
                , el [] <|
                    link []
                        { url = "https://github.com/kino-ma/elm-web"
                        , label = text "page source"
                        }
                ]
        ]



{-
meLink : List (Attribute msg) -> String -> String -> Element msg
meLink url t props =
    let
        props_ = (href url::Styles.subStyle ++ props)
    in
        Element.link props_ [text t]

mainDiv : List (Html msg) -> Html msg
mainDiv nodes =
    div (Styles.mainStyle) nodes
    -}