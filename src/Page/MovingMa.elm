module Page.MovingMa exposing (..)

import Html exposing (..)
import Html.Attributes as Attr exposing (style)
import Url

import Page
import Css exposing (..)
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
    (model, Cmd.none)


view : Model -> Page.View Msg
view model =
    { title = "𝑴𝒐𝒗𝒊𝒏𝒈 𝑴𝑨"
    , content = Html.p [ style "text-align" "center", style "left" (pos model) ] [ text "𝑴𝒐𝒗𝒊𝒏𝒈 𝑴𝑨" ]
    , fullScreen = True
    }


pos : Model -> String
pos model =
    String.fromInt model.x


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none