module Dropdown exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

-- model

type alias Model =
  { items : List Int
  , isOpen : Bool
  , selected: Int
  }

init : Model
init =
  { items = [1, 2, 3]
  , isOpen = False
  , selected = 1
  }

-- update

type Msg = Show | Change Int

update : Msg -> Model -> Model
update msg model =
  case msg of
    Show ->
      { model | isOpen = not model.isOpen }
    Change sel ->
      { model | selected = sel }

-- view

view : Model -> Html Msg
view model =
  let
    items = (List.map renderItems model.items)
  in
    div [] [ renderBase model ]


renderBase : Model -> Html Msg
renderBase model =
  let
    items = List.map renderItems model.items
    colorClass =  if model.selected == 1 then
                    "btn-default"
                  else if model.selected == 2 then
                    "btn-success"
                  else
                    "btn-danger"
    displayText = ((toString model.selected) ++ "   ")
  in
    div [ class "dropdown" ]
    [ button
      [ class ("btn dropdown-toggle " ++ colorClass)
      , type' "button"
      , attribute "data-toggle" "dropdown"
      , attribute "aria-haspopup" "true"
      , attribute "aria-expanded" "true"
      ]
      [ text displayText
      , span [ class "caret" ] []
      ]

    , ul
      [ class "dropdown-menu"
      , attribute "aria-labelledby" "dropdownMenu1"
      ]
      items
    ]

renderItems : Int -> Html Msg
renderItems val =
  li [] [ a [ href "#", onClick (Change val) ] [ text (toString val) ] ]
