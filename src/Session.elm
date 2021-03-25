module Session exposing (..)

import Browser.Navigation as Nav

type Session
    = Session Nav.Key

fromKey : Nav.Key -> Session
fromKey key =
    Session key

toKey : Session -> Nav.Key
toKey (Session key) =
    key
