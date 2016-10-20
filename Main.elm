module Main exposing (..)

import Array exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App


--model


type alias Model =
    { turn : Player
    , result : Maybe Player
    , game : Array Array Maybe Play
    }


type Token
    = X
    | O


type Play
    = Token


type Player
    = P1
    | P2


initRow : Array Maybe Play
initRow =
    [ Nothing, Nothing, Nothing ]


initGame : Array Array Maybe Play
initGame =
    [ initRow, initRow, initRow ]


initModel : Model
initModel =
    { turn = P1
    , result = Nothing
    , game = initGame
    }



--update


type Msg
    = Turn Int Int


update : Msg -> Model -> Model
update msg model =
    case msg of
        _ ->
            model



--view


view : Model -> Html Msg
view model =
    div []
        [ gameBoard model.game
        ]


gameBoard : Array Array Maybe Play -> Html Msg
gameBoard game =
    div [] map ( row -> displayRow row ) game

