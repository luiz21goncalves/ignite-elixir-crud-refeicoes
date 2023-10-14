defmodule Exmeal.MealsTest do
  use Exmeal.DataCase, async: true

  import Exmeal.Factory

  alias Ecto.Changeset

  alias Exmeal.Meal

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      user_params = build(:user_params)

      Exmeal.create_user(user_params)

      response =
        :meal_params
        |> build()
        |> Meal.changeset()

      assert %Changeset{
               changes: %{
                 description: "Banana",
                 date: ~D[2001-05-02],
                 calories: 20,
                 user_id: _user_id
               },
               valid?: true
             } = response
    end
  end
end
