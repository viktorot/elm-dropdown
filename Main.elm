import Html.App as App
import Html exposing  (..)

import Dropdown

-- model

type alias Model =
  { dropdownModel : Dropdown.Model }

init : Model
init =
  { dropdownModel = Dropdown.init
  }

-- update

type Msg = Nothing | Dropdown Dropdown.Msg

update : Msg -> Model -> Model
update msg model =
  case msg of
    Dropdown msg0 ->
      { model | dropdownModel =  Dropdown.update msg0 model.dropdownModel }
    Nothing ->
      model

-- view

view : Model -> Html Msg
view model =
  div []
  [ App.map Dropdown (Dropdown.view model.dropdownModel)
  , h2 [] []
  ]


main : Program Never
main =
  App.beginnerProgram
  { model = init
  , view = view
  , update = update
  }
