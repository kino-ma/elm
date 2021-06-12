module Page.MovingMa exposing (..)

import Css exposing (..)
import Html exposing (..)
import Html.Attributes as Attr exposing (style)
import Page
import Session exposing (Session)
import Url


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
view model =
    { title = "𝑴𝒐𝒗𝒊𝒏𝒈 𝑴𝑨"
    , content =
        Html.div [ class MovingMa "" ]
            [ Html.img [ Attr.src "https://www.kino.ma/ma.jpg", Attr.width 256, class MovingMa "moving-ma" ] [ text "𝑴𝒐𝒗𝒊𝒏𝒈 𝑴𝑨" ]
            ]
    , fullScreen = True
    }


pos : Model -> String
pos model =
    String.fromInt model.x


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
