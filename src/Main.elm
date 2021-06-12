module Main exposing (..)

import Browser exposing (Document)
import Browser.Navigation as Nav
import Css exposing (..)
import Html exposing (..)
import Html.Attributes exposing (href, rel, src, style)
import Page exposing (Page)
import Page.AddContent as AddContent
import Page.Blank as Blank
import Page.Home as Home
import Page.MovingMa as MovingMa
import Route exposing (Route)
import Session exposing (..)
import Url
import Url.Parser exposing ((</>), Parser, int, map, oneOf, s, string)


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }


type Model
    = Redirect Session Url.Url
    | Home Home.Model
    | AddContent AddContent.Model
    | MovingMa MovingMa.Model


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    (changeRouteTo <| Route.fromUrl url) <| Redirect (Session.fromKey key) url


type Msg
    = GotAddContentMsg AddContent.Msg
    | GotHomeMsg Home.Msg
    | GotMovingMaMsg MovingMa.Msg
    | LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url


changeRouteTo : Maybe Route -> Model -> ( Model, Cmd Msg )
changeRouteTo maybeRoute model =
    let
        session =
            toSession model
    in
    case maybeRoute of
        Just Route.Home ->
            updateWith Home GotHomeMsg model <|
                Home.init session

        Just Route.AddContent ->
            updateWith AddContent GotAddContentMsg model <|
                AddContent.init session

        Just Route.MovingMa ->
            updateWith MovingMa GotMovingMaMsg model <|
                MovingMa.init session

        Just Route.None ->
            ( model, Cmd.none )

        Nothing ->
            updateWith Home GotHomeMsg model <|
                Home.init session


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        session =
            toSession model
    in
    case ( msg, model ) of
        ( GotAddContentMsg subMsg, AddContent subModel ) ->
            AddContent.update subMsg subModel
                |> updateWith AddContent GotAddContentMsg model

        ( LinkClicked urlRequest, _ ) ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl (Session.toKey session) (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        ( UrlChanged url, _ ) ->
            let
                url_ =
                    Route.fromUrl url
            in
            changeRouteTo url_ model

        _ ->
            ( model, Cmd.none )


toSession : Model -> Session
toSession model =
    case model of
        Home subModel ->
            Home.toSession subModel

        AddContent subModel ->
            AddContent.toSession subModel

        MovingMa subModel ->
            MovingMa.toSession subModel

        Redirect session _ ->
            session


updateWith : (subModel -> Model) -> (subMsg -> Msg) -> Model -> ( subModel, Cmd subMsg ) -> ( Model, Cmd Msg )
updateWith toModel toMsg model ( subModel, subCmd ) =
    ( toModel subModel
    , Cmd.map toMsg subCmd
    )


subscriptions : Model -> Sub Msg
subscriptions model =
    case model of
        Home subModel ->
            Sub.map GotHomeMsg <|
                Home.subscriptions subModel

        AddContent subModel ->
            Sub.map GotAddContentMsg <|
                AddContent.subscriptions subModel

        MovingMa subModel ->
            Sub.map GotMovingMaMsg <|
                MovingMa.subscriptions subModel

        _ ->
            Sub.none


view : Model -> Document Msg
view model =
    let
        viewPage page toMsg config =
            let
                { title, body } =
                    Page.view page config
            in
            { title = title
            , body = List.map (Html.map toMsg) body
            }
    in
    case model of
        Home subModel ->
            viewPage Page.Home GotHomeMsg <|
                Home.view subModel

        AddContent subModel ->
            viewPage Page.AddContent GotAddContentMsg <|
                AddContent.view subModel

        MovingMa subModel ->
            viewPage Page.MovingMa GotMovingMaMsg <|
                MovingMa.view subModel

        Redirect key url ->
            viewPage Page.AddContent GotAddContentMsg <|
                Blank.view
