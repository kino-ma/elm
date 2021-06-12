module Page.Blank exposing (view)

import Html

import Page


view : Page.View msg
view =
    { title = ""
    , content = Html.text ""
    , fullScreen = True
    }
