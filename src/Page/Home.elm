module Page.Home exposing (..)

import Html exposing (..)
import Html.Attributes exposing (href, rel)
import Url

import Css exposing (..)


type alias Model
    = String


type alias Msg =
    ()


init : ( Model, Cmd Msg )
init =
    ( "/", Cmd.none)


view : Model -> { title: String, content: Html msg }
view model =
    { title = "Welcome to kino.ma"
    , content = 
        div [class Style "root" ]
            [ h1 [ class Style "header" ] [ text "Welcome to kino.ma" ]
            , div []
                [ p [] [ text "Hello, this is kino.ma home page." ]
                , p [] [ text <| "You're now at " ++ model ]
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
    }


aChild : String -> List (Attribute msg) -> String -> Html msg
aChild link atrs content =
    a (atrs ++ [class Style "child", class Style "content",  href link ]) [ text content ]