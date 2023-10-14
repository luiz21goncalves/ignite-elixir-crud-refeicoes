defmodule Exmeal.UsersTest do
  use Exmeal.DataCase, async: true

  import Exmeal.Factory

  alias Ecto.Changeset
  alias Exmeal.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:user_params)

      response = User.changeset(params)

      assert %Changeset{
               changes: %{
                 name: "John Doe",
                 email: "john.doe@email.com"
               },
               valid?: true
             } = response
    end

    test "when there are invalid params, returns an error" do
      params = %{name: "Jonh Doe"}

      response = User.changeset(params)

      expected_response = %{document: ["can't be blank"], email: ["can't be blank"]}

      assert errors_on(response) == expected_response
    end
  end

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      user = build(:user)
      params = %{name: "Jane", email: "jane@email.com"}

      response = User.changeset(user, params)

      assert %Changeset{
               changes: %{
                 name: "Jane",
                 email: "jane@email.com"
               },
               valid?: true
             } = response
    end

    test "when there are invalid params, returns an error" do
      user = build(:user)
      params = %{email: "", document: 123_123_123}

      response = User.changeset(user, params)

      expected_response = %{document: ["is invalid"], email: ["can't be blank"]}

      assert errors_on(response) == expected_response
    end
  end
end
