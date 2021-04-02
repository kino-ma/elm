module Page.Home exposing (..)

import Html exposing (..)
import Html.Attributes exposing (href, rel)
import Url

import Css exposing (..)
import Session exposing (Session)


type alias Model =
    { message : String
    , session : Session
    }


type alias Msg =
    ()


init : Session -> ( Model, Cmd Msg )
init session =
    let
        model =
            { session = session
            , message = "/"
            }
    in
    (model, Cmd.none)


view : Model -> { title: String, content: Html msg }
view model =
    { title = "Welcome to kino.ma"
    , content = 
        div [class Style "root" ]
            [ h1 [ class Style "header" ] [ text "Welcome to kino.ma" ]
            , div []
                [ p [] [ text "Hello, this is kino.ma home page." ]
                ]
            , div [class Style "container"]
                [ aChild "https://twitter.kino.ma" [] "Twitter"
                , aChild "https://mastodon.kino.ma/@makino" [rel "me"] "Mastodon" 
                , aChild "https://github.com/kino-ma" [] "GitHub"
                ]
            , div [class Style "container"]
                [ a [ href "https://github.com/kino-ma/www.kino.ma" ] [ text "page source" ]
                ]
            ]
    }


colN : Int -> List (Attribute msg) -> List (Html msg) -> Html msg
colN n attrs =
    let
        n_ =
            if n <= 12 then
                if n >= 1 then 
                    n
                else
                    1
            else
                12
        nStr = String.fromInt n_
        cls = class Style <| "col-" ++ nStr
    in
        div <| cls :: attrs


oneThirdCol : List (Html msg) -> List (Html msg) -> List (Html msg) -> List (Html msg)
oneThirdCol colA colB colC =
    [ colN 4 [] colA
    , colN 8 [] colB
    , colN 12 [] colC
    ]


aChild : String -> List (Attribute msg) -> String -> Html msg
aChild link atrs content =
    a (atrs ++ [class Style "child", class Style "content",  href link ]) [ text content ]


toSession : Model -> Session
toSession model =
    model.session