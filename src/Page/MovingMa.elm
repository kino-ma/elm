module Page.MovingMa exposing (..)

import Css exposing (..)
import Html exposing (..)
import Html.Attributes as Attr
import Page
import Session exposing (Session)


type alias Model =
    { session : Session
    , x : Int
    }


type alias Msg =
    ()


toSession : Model -> Session
toSession model =
    model.session


init : Session -> ( Model, Cmd Msg )
init session =
    let
        model =
            { session = session
            , x = 0
            }
    in
    ( model, Cmd.none )


view : Model -> Page.View Msg
view _ =
    { title = "𝑴𝒐𝒗𝒊𝒏𝒈 𝑴𝑨"
    , content =
        Html.div [ class MovingMa "moving-ma" ]
            [ Html.img [ Attr.src "https://www.kino.ma/ma.jpg", Attr.width 256, Attr.alt "𝑴𝒐𝒗𝒊𝒏𝒈 𝑴𝑨" ] []
            ]
    , fullScreen = True
    }


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
