module Main exposing (..)
import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Styles exposing (..)


main = 
    Browser.document
    { init = init
    , subscriptions = subs
    , update = update
    , view = view
    }



type alias Model = 
    { head : String
    , content : String
    }

init : () -> (Model, Cmd Msg)
init _ =
    ( Model "Welcome to kino.ma" "Hello, this is kino.ma home page."
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

view : Model -> Document Msg
view model =
    Document "Welcome to kino.ma"
    [ div baseStyle
        [ h1 headerStyle [ text model.head ]
        , div (mainStyle ++ [])
            [ p [] [ text model.content ]
            ]
        , div (mainStyle ++ [])
            [ a (subStyle ++ [ href "https://twitter.kino.ma"]) [ text "Twitter" ]
            , a (subStyle ++ [ rel "me", href "https://mastodon.kino.ma/@makino" ]) [ text "Mastodon" ]
            , a (subStyle ++ [ href "https://github.com/kino-ma" ]) [ text "GitHub" ]
            ]
        , div (mainStyle ++ [])
            [ a [ href "https://github.com/kino-ma/elm-web" ] [ text "page source" ]
            ]
        ]
    ]
