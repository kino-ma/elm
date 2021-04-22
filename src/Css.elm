module Css exposing (..)

import Html exposing (Attribute)
import Html.Attributes as Attributes


{-
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

subStyle = generateStyle
    [ ("display", "inline")
    , ("margin", "0.5em")
    ]
-}

type Css
    = Style

cssPrefix : Css -> String
cssPrefix css =
    case css of 
        Style -> 
            "style__"


className : Css -> String -> String
className css name =
    cssPrefix css ++ name


class : Css -> String -> Attribute msg
class css name = 
    Attributes.class <| className css name

plainClass : String -> Attribute msg
plainClass = Attributes.class


classList : Css -> List ( String, Bool ) -> Attribute msg
classList css ls =
    Attributes.classList <|
        List.map (Tuple.mapFirst (className css)) ls
        

id : Css -> String -> Attribute msg
id css name = 
    Attributes.id <| className css name
