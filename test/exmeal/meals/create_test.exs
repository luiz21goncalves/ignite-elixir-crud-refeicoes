defmodule Exmeal.Meals.CreateTest do
  use Exmeal.DataCase, async: true

  describe "call/1" do
    test "when all params are valid, returns the meal" do
      params = %{
        calories: 20,
        date: ~D[2001-05-02],
        description: "Banana"
      }

      response = Exmeal.create_meal(params)

      assert {:ok,
              %Exmeal.Meal{
                calories: 20,
                date: ~D[2001-05-02],
                description: "Banana",
                id: _id
              }} = response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        calories: 20,
        date: ~D[2001-05-02]
      }

      response = Exmeal.create_meal(params)

      expected_response = %{description: ["can't be blank"]}

      assert {:error, %Exmeal.Error{status: :bad_request, result: changeset}} = response
      assert errors_on(changeset) == expected_response
    end
  end
end
