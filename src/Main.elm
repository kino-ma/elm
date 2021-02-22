module Main exposing (..)
import Browser
import Html exposing (..)
import Html.Attributes exposing (href, rel, src)
import Css exposing (..)


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
    [ header [class Style "page-header-container"]
        [ img [src "https://www.kino.ma/favicon.ico", class Style "page-header-icon"]  []
        , div [class Style "page-header-child" ] [ text "hoge" ]
        ]
    , div [class Style "root" ]
        [ h1 [ class Style "header" ] [ text model.head ]
        , div []
            [ p [] [ text model.content ]
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