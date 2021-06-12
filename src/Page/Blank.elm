module Page.Blank exposing (view)

import Html exposing (Html)

import Page


view : Page.View msg
view =
    { title = ""
    , content = Html.text ""
    , fullScreen = True
    }
