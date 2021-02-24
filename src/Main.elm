module Main exposing (..)

import Browser exposing (Document)
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (href, style, rel, src)
import Url
import Url.Parser exposing (Parser, (</>), int, map, oneOf, s, string)

import Css exposing (..)
import Route exposing (Route)
import Page exposing (Page)
import Page.AddContent as AddContent
import Page.Home as Home
import Page.Blank as Blank


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
    = Redirect Nav.Key Url.Url
    | Home Home.Model
    | AddContent AddContent.Model



init : () -> Url.Url -> Nav.Key -> (Model, Cmd Msg)
init flags url key =
    (changeRouteTo <| (Route.fromUrl url)) <| (Redirect key url)


type Msg
    = GotAddContentMsg AddContent.Msg
    | GotHomeMsg Home.Msg
    | LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url


changeRouteTo : Maybe Route -> Model -> ( Model, Cmd Msg )
changeRouteTo maybeRoute model =
    case maybeRoute of
        Nothing -> 
            updateWith Home GotHomeMsg model
                <| Home.init 

        Just Route.Home ->
            updateWith Home GotHomeMsg model
                <| Home.init 

        Just Route.AddContent ->
            updateWith AddContent GotAddContentMsg model
                <| AddContent.init 

    

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case ( msg, model ) of
        ( GotAddContentMsg subMsg, AddContent subModel ) ->
            AddContent.update subMsg subModel
                |> updateWith AddContent GotAddContentMsg model

        ( LinkClicked urlRequest, Redirect key _ ) -> 
            case urlRequest of
                Browser.Internal url ->
                    (model, Nav.pushUrl key (Url.toString url))

                Browser.External href ->
                    (model, Nav.load href)

        ( UrlChanged url, _ ) ->
            changeRouteTo (Route.fromUrl url) model

        _ ->
            (model, Cmd.none)


updateWith : (subModel -> Model) -> (subMsg -> Msg) -> Model -> ( subModel, Cmd subMsg ) -> ( Model, Cmd Msg )
updateWith toModel toMsg model ( subModel, subCmd ) =
    ( toModel subModel
    , Cmd.map toMsg subCmd
    )


subscriptions : Model -> Sub Msg
subscriptions _ =
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
            viewPage Page.Home GotHomeMsg
                <| Home.view subModel

        AddContent subModel ->
            viewPage Page.AddContent GotAddContentMsg
                <| AddContent.view subModel 
        
        _ ->
            Page.view Page.Other Blank.view