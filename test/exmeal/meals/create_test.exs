defmodule Exmeal.Meals.CreateTest do
  use Exmeal.DataCase, async: true

  import Exmeal.Factory

  alias Exmeal.{Meal, User}

  describe "call/1" do
    test "when all params are valid, returns the meal" do
      user_params = build(:user_params)

      {:ok, %User{id: user_id}} = Exmeal.create_user(user_params)

      params = build(:meal_params, %{user_id: user_id})

      {:ok, %Meal{id: id} = response} = Exmeal.create_meal(params)

      assert %Meal{
               calories: 20,
               date: ~D[2001-05-02],
               description: "Banana",
               id: ^id,
               user_id: ^user_id
             } = response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        calories: 20,
        date: ~D[2001-05-02]
      }

      response = Exmeal.create_meal(params)

      expected_response = %{description: ["can't be blank"], user_id: ["can't be blank"]}

      assert {:error, %Exmeal.Error{status: :bad_request, result: changeset}} = response
      assert errors_on(changeset) == expected_response
    end
  end
end
