module Main exposing (..)
import Browser
import Html exposing (Html, button, div, text, Attribute, div, input)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


main = 
    Browser.sandbox { init = init, update = update, view = view }

type alias Model = String

init : Model
init =
    "Hello World"

type Msg = Update

update : Msg -> Model -> Model
update msg model =
    "!" ++ model ++ "!"


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text model ]
        , div [] [ button [ onClick Update ] [ text "update" ] ]
        ]
