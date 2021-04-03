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
        div [ id Style "home-root", class Style "flex-container-center" ]
            [ h1 [ class Style "header" ] [ text "Welcome to kino.ma" ]
            , div []
                [ p [] [ text "Hello, this is kino.ma home page." ]
                ]
                , main_ [ class Style "card-tile-base"]
                    [ cardTile [] (text "Links")
                        [ ul [ class Style "card-content", class Style "me-link-list" ]
                            [ meLinkListItems [ aChild "https://twitter.kino.ma" [] "Twitter" ]
                            , meLinkListItems [ aChild "https://mastodon.kino.ma/@makino" [rel "me"] "Mastodon" ]
                            , meLinkListItems [ aChild "https://github.com/kino-ma" [] "GitHub" ]
                            ]
                        ]
                    , cardTile [] (text "About")
                        [ cardTextContent "慶応大学環境情報学部三年　牧野青希"
                        ]
                    , cardTile [] (text "Awards")
                        [ ul [ class Style "card-content", class Style "general-list-items" ]
                            [ li [] [text "Hack U SFC 2019 最優秀賞"]
                            , li [] [text "Open Hack U Online 2020 vol.2 最優秀賞"]
                            , li [] [text "Hack Day Online 2021 Eaglys賞"]
                            ]
                        ]
                    , cardTile [] (text "Something")
                        [ cardTextContent "fuga"
                        ]
                    , cardTile [] (text "Foo")
                        [ cardTextContent "fuga"
                        ]
                    , cardTile [] (text "Bar")
                        [ cardTextContent "fuga"
                        ]
                    , cardTile [] (text "hoge")
                        [ cardTextContent "fuga"
                        ]
                    , cardTile [] (text "hoge")
                        [ cardTextContent "fuga"
                        ]
                    , cardTile [] (text "hoge")
                        [ cardTextContent "fuga"
                        ]
                    ]
            , div [class Style "flex-container"]
                [ a [ href "https://github.com/kino-ma/www.kino.ma" ] [ text "page source" ]
                ]
            ]
    }


cardTile : List (Attribute msg) -> Html msg -> List (Html msg) -> Html msg
cardTile attrs title content =
    div
        (attrs ++ [ class Style "card-tile"])
        ((h2 [ class Style "tile-header" ] [title]) :: content)


cardTextContent : String -> Html msg
cardTextContent content =
    p
        [ class Style "card-content" ]
        [ text content ]


meLinkListItems =
    li [ class Style "me-link-list-items" ]


aChild : String -> List (Attribute msg) -> String -> Html msg
aChild link atrs content =
    a (atrs ++ [ class Style "me-link", href link ]) [ text content ]


toSession : Model -> Session
toSession model =
    model.session