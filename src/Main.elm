module Main exposing (..)
import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Styles


main : Program () Model Msg
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


subs : a -> Sub msg
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
    [ div Styles.baseStyle
        [ h1 Styles.headerStyle [ text model.head ]
        , mainDiv
            [ p [] [ text model.content ]
            ]
        , mainDiv
            [ meA "https://twitter.kino.ma" "Twitter " []
            , meA "https://mastodon.kino.ma/@makino" "Mastodon " [rel "me"]
            , meA "https://github.com/kino-ma" "Github" []
            ]
        , mainDiv
            [ a [ href "https://github.com/kino-ma/elm-web" ] [ text "page source" ]
            ]
        ]
    ]


meA : String -> String -> List (Attribute msg) -> Html msg
meA url t props =
    let
        props_ = (href url::Styles.subStyle ++ props)
    in
        a props_ [text t]

mainDiv : List (Html msg) -> Html msg
mainDiv nodes = 
    div (Styles.mainStyle) nodes
