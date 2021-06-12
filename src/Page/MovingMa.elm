module Page.MovingMa exposing (..)

import Html exposing (..)
import Html.Attributes as Attr exposing (style)
import Url

import Page
import Css exposing (..)
import Session exposing (Session)


type alias Model =
    { message : String
    , session : Session
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
            , message = "/"
            }
    in
    (model, Cmd.none)


view : Model -> Page.View Msg
view model =
    { title = "𝑴𝒐𝒗𝒊𝒏𝒈 𝑴𝑨"
    , content = Html.p [ style "text-align" "center" ] [ text "𝑴𝒐𝒗𝒊𝒏𝒈 𝑴𝑨" ]
    , fullScreen = True
    }