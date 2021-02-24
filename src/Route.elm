module Route exposing (..)

import Url exposing (Url)
import Url.Parser exposing (Parser, (</>), int, map, oneOf, s, string)

type Route 
    = Home
    | AddContent


fromUrl : Url -> Maybe Route
fromUrl url = Nothing