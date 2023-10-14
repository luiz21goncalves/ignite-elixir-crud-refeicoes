defmodule Exmeal.Users.CreateTest do
  use Exmeal.DataCase, async: true

  import Exmeal.Factory

  describe "call/1" do
    test "when all params are valid, returns the user" do
      user_params = build(:user_params)

      {:ok, response} = Exmeal.create_user(user_params)

      id = response.id

      assert %Exmeal.User{
               name: "John Doe",
               email: "john.doe@email.com",
               document: "12345678910",
               id: ^id
             } = response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        document: 12_345_678_900,
        email: "john.doe"
      }

      response = Exmeal.create_user(params)

      expected_response = %{
        name: ["can't be blank"],
        document: ["is invalid"],
        email: ["has invalid format"]
      }

      assert {:error, %Exmeal.Error{status: :bad_request, result: changeset}} = response
      assert errors_on(changeset) == expected_response
    end
  end
end
