defmodule Exmeal.Meals.Create do
  alias Exmeal.Meal
  alias Exmeal.Repo

  def call(params) do
    params
    |> Meal.changeset()
    |> Repo.insert()
  end
end
