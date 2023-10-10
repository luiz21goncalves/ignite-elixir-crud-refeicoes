defmodule Exmeal do
  alias Exmeal.Meals.Create, as: MealCreate
  alias Exmeal.Meals.Delete, as: MealDelete
  alias Exmeal.Meals.Get, as: MealGet

  defdelegate create_meal(params), to: MealCreate, as: :call
  defdelegate delete_meal(params), to: MealDelete, as: :call
  defdelegate get_meal_by_id(id), to: MealGet, as: :by_id
end
