module Styles exposing (..)
import Html.Attributes exposing (..)

baseStyle_ = 
    [ ("margin", "1em")
    ]

headerStyle_ =
    baseStyle_ ++
    [
    ]

mainStyle_ = 
    baseStyle_ ++
    [ ("colour", "#F0F0F0")
    ]

baseStyle = generateStyle baseStyle_
headerStyle = generateStyle headerStyle_
mainStyle = generateStyle mainStyle_


generateStyle l = 
    case l of
        ((f,s)::l2) ->
            (style f s) :: generateStyle l2
        [] ->
            []
