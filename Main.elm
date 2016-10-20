module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App


--model


type alias Model =
    { turn : Player
    , result : Maybe Player
    , game : List (List Maybe Play)
    }


type Token
    = X
    | O


type Play
    = Token


type Player
    = P1
    | P2


initRow : List (Maybe Play)
initRow =
    [ Nothing, Nothing, Nothing ]


initGame : List (List (Maybe Play))
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


gameBoard : List (List Maybe Play) -> Html Msg
gameBoard game =
    div [] <| List.indexedMap (\rowNum -> (\row -> tr [] [ gameRow rowNum row ])) game


renderCell : Int -> Int -> Maybe Play -> Html Msg
renderCell row column status =
    td [ onClick <| Turn row column ]


gameRow : Int -> List Maybe Play -> Html Msg
gameRow rowNum row =
    let
        cells =
            List.indexedMap renderCell row
    in
        td [] cells
