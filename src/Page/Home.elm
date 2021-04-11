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
        main_ [ class Style "main-content", class Style "flex-container-center" ]
            [ h1 [ id Style "main-heading" ] [ text "kino-ma" ]
            , div [ class Style "card-tile-base"]
                [ cardDescription
                , cardOrganizations
                , cardLinks
                , cardAwards
                , cardProducts
                , cardLanguages
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


cardText : String -> Html msg
cardText content =
    p
        [ class Style "card-content" ]
        [ text content ]


cardTextMultiLine : List (String) -> Html msg
cardTextMultiLine contents =
    let
        concatLines a bs =
            if not (List.isEmpty bs)
                then a :: br [] [] :: bs
                else a :: bs
        multiLine2text =
            List.foldr concatLines [] <<
                List.map text
    in
    p
        [ class Style "card-content" ]
        <| multiLine2text contents


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
        [ cardTextMultiLine
            [ "牧野青希 - Seiki Makino"
            , "慶應義塾大学環境情報学部　2019年度入学"
            ]
        ]


cardOrganizations : Html msg
cardOrganizations =
    cardTile [] "Organizations"
        [ ul [ class Style "card-content", class Style "general-list" ]
            [ li []
                [ a [ href "https://rg.sfc.wide.ad.jp" ] [ text "慶應大学 徳田・村井合同研究室" ]
                , ul []
                    [ li [] [ a [ href "https://www.jn.sfc.keio.ac.jp" ] [ text "中澤研究会" ] ]
                    , li [] [ a [ href "https://rgroot.sfc.wide.ad.jp/" ] [ text "植原研究会" ] ]
                    , li [] [ a [ href "https://d-trust.sfc.wide.ad.jp/" ] [ text "手塚研究会" ] ]
                    ]
                ]
            , li [] [ a [ href "https://github.com/makino-makino" ] [ text "魔法少女まきの☆マキノ" ] ]
            ]
        ]


cardLinks : Html msg
cardLinks = 
    cardTile [] "Links"
        [ ul [ class Style "card-content", class Style "general-list" ]
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


cardLanguages : Html msg
cardLanguages = 
    cardTile [] "Languages"
        {-[ cardTextContent
            "日本語, English (a little), Rust, Python, C/C++, JS (React, Node, TypeScript), Go, Haskell, Elm (This page is written in Elm), V"
        ] -}
        [ ol [ class Style "card-content", class Style "language-list" ]
            [ li [] [ text "Rust" ]
            , li [] [ text "Python" ]
            , li [] [ text "C/C++" ]
            , li [] [ text "JS - React, Node, TypeScript" ]
            , li [] [ text "Go" ]
            , li [] [ text "Haskell" ]
            , li [] [ text "Elm - This page is written in Elm" ]
            , li [] [ text "V - Contributor" ]
            , li [] [ text "日本語" ]
            , li [] [ text "English (a little)" ]
            ]
        ]


cardPlaceHolder : Html msg
cardPlaceHolder =
    cardTile [] "Something"
        [ cardText "fuga"
        ]