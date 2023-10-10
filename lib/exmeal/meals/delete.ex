defmodule Exmeal.Meals.Delete do
  alias Exmeal.Error
  alias Exmeal.Meal
  alias Exmeal.Repo

  def call(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_meal_not_found_error()}
      meal -> Repo.delete(meal)
    end
  end
end
