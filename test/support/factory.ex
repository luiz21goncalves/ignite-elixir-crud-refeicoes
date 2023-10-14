defmodule Exmeal.Factory do
  use ExMachina.Ecto, repo: Exmeal.Repo

  alias Exmeal.User

  def user_params_factory do
    %{name: "John Doe", email: "john.doe@email.com", document: "12345678910"}
  end

  def user_factory do
    %User{
      name: "John Doe",
      email: "john.doe@email.com",
      document: "12345678910",
      id: "69961117-d966-4e2f-ac55-476d4f78dddf"
    }
  end
end
