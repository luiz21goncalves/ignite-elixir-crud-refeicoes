defmodule Exmeal.Meals.Create do
  alias Exmeal.Error
  alias Exmeal.Meal
  alias Exmeal.Repo

  def call(params) do
    params
    |> Meal.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  def handle_insert({:ok, %Meal{}} = result), do: result

  def handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
