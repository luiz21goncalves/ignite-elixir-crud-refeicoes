defmodule Exmeal.Users.UpdateTest do
  use Exmeal.DataCase, async: true

  import Exmeal.Factory

  describe "call/1" do
    test "when a valid id is given, returns the meal" do
      user_params = build(:user_params)

      {:ok, %Exmeal.User{id: id}} = Exmeal.create_user(user_params)

      response =
        Exmeal.update_user(%{
          "id" => id,
          "name" => "Jane Doe",
          "email" => "jane.doe@email.com"
        })

      assert {:ok,
              %Exmeal.User{
                name: "Jane Doe",
                email: "jane.doe@email.com",
                document: "12345678910",
                id: ^id
              }} = response
    end

    test "when an invalid id is given, returns an error" do
      id = "a6ef9b39-d638-4835-9ad7-dbe48d1257eb"
      response = Exmeal.update_user(%{"id" => id})

      assert {:error, %Exmeal.Error{result: "User not found.", status: :not_found}} = response
    end
  end
end
