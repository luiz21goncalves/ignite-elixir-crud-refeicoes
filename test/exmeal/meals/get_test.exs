defmodule Exmeal.Meals.GetTest do
  use Exmeal.DataCase, async: true

  import Exmeal.Factory

  alias Exmeal.{Meal, User}

  describe "by_id/1" do
    test "when a valid id is given, returns the meal" do
      user_params = build(:user_params)

      {:ok, %User{id: user_id}} = Exmeal.create_user(user_params)

      params = build(:meal_params, %{user_id: user_id})

      {:ok, %Meal{id: id}} = Exmeal.create_meal(params)

      response = Exmeal.get_meal_by_id(id)

      assert {:ok,
              %Meal{
                calories: 20,
                date: ~D[2001-05-02],
                description: "Banana",
                id: ^id,
                user_id: ^user_id
              }} = response
    end

    test "when an invalid id is given, returns an error" do
      id = "a6ef9b39-d638-4835-9ad7-dbe48d1257eb"
      response = Exmeal.get_meal_by_id(id)

      assert {:error, %Exmeal.Error{result: "Meal not found.", status: :not_found}} = response
    end
  end
end
