defmodule ExmealWeb.MealsController do
  use ExmealWeb, :controller

  alias Exmeal.Meal
  alias ExmealWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Meal{} = meal} <- Exmeal.create_meal(params) do
      conn
      |> put_status(:created)
      |> json(%{meal: meal})
    end
  end
end
