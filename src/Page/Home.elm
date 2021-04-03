module Page.Home exposing (..)

import Html exposing (..)
import Html.Attributes as Attr exposing (href, rel)
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
            [ h1 [ class Style "heading" ] [ text "Welcome to kino.ma" ]
            , main_ [ class Style "card-tile-base"]
                [ cardDescription
                , cardLinks
                , cardAwards
                , cardProducts
                , cardPlaceHolder
                , cardPlaceHolder
                , cardPlaceHolder
                , cardPlaceHolder
                , cardPlaceHolder
                , cardPlaceHolder
                ]
            ]
    }


cardTile : List (Attribute msg) -> String -> List (Html msg) -> Html msg
cardTile attrs title content =
    div
        (attrs ++ [ class Style "card-tile"])
        (( h2
            [ class Style "tile-heading", Attr.id title ]
            [ a [ class Style "tile-heading-link", href ("#" ++ title) ] [text title]])
            :: content)


cardTextContent : String -> Html msg
cardTextContent content =
    p
        [ class Style "card-content" ]
        [ text content ]


meLinkListItems : List (Html msg) -> Html msg
meLinkListItems =
    li [ class Style "me-link-list-items" ]


aChild : String -> List (Attribute msg) -> String -> Html msg
aChild link atrs content =
    a (atrs ++ [ class Style "me-link", href link ]) [ text content ]


toSession : Model -> Session
toSession model =
    model.session


cardDescription : Html msg
cardDescription =
    cardTile [] "About"
        [ cardTextContent "慶応大学環境情報学部三年　牧野青希"
        ]


cardLinks : Html msg
cardLinks = 
    cardTile [] "Links"
        [ ul [ class Style "card-content", class Style "me-link-list" ]
            [ meLinkListItems [ aChild "https://twitter.kino.ma" [] "Twitter" ]
            , meLinkListItems [ aChild "https://mastodon.kino.ma/@makino" [rel "me"] "Mastodon" ]
            , meLinkListItems [ aChild "https://github.com/kino-ma" [] "GitHub" ]
            ]
        ]


cardAwards : Html msg
cardAwards = 
    cardTile [] "Awards"
        [ ul [ class Style "card-content", class Style "general-list" ]
            [ li [] [text "Hack U SFC 2019 最優秀賞"]
            , li [] [text "Open Hack U Online 2020 vol.2 最優秀賞"]
            , li [] [text "Hack Day Online 2021 Eaglys賞"]
            ]
        ]


cardProducts : Html msg
cardProducts = 
    cardTile [] "Products"
        [ ul [ class Style "card-content", class Style "general-list" ]
            [ li [] [ a [ href "https://github.com/pj-aias" ] [ text "匿名認証システム AIAS" ] ]
            , li [] [ a [ href "https://www.slideshare.net/kino___ma/neopanopticon-hacku-sfc-2019-201816573" ] [ text "魔法のSNS Neo-Panopticon" ] ]
            , li [] [ a [ href "https://speakerdeck.com/yosh1/hack-day-2021-maigo" ] [ text "人探しサービス MAIGO" ] ]
            , li [] [ a [ href "https://github.com/kino-ma/qcure" ] [ text "ドメイン固有言語qcure" ] ]
            ]
        ]


cardPlaceHolder : Html msg
cardPlaceHolder =
    cardTile [] "Something"
        [ cardTextContent "fuga"
        ]