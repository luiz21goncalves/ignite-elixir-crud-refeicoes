defmodule ExmealWeb.MealsController do
  alias Exmeal.Meal
  use ExmealWeb, :controller

  def create(conn, params) do
    with {:ok, %Meal{} = meal} <- Exmeal.create_meal(params) do
      conn
      |> put_status(:created)
      |> json(%{meal: meal})
    end
  end
end
