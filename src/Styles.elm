module Styles exposing (..)
import Html.Attributes exposing (..)

baseStyle = generateStyle
    [ ("margin", "1em")
    , ("display", "block")
    ]

headerStyle = baseStyle ++ generateStyle
    [ ("text-align", "center")
    ]

mainStyle = baseStyle ++ generateStyle
    [ ("colour", "#F0F0F0")
    , ("text-align", "center")
    ]

-- baseStyle = generateStyle baseStyle_
-- headerStyle = generateStyle headerStyle_
-- mainStyle = generateStyle mainStyle_


generateStyle l = 
    case l of
        ((f,s)::l2) ->
            (style f s) :: generateStyle l2
        [] ->
            []
