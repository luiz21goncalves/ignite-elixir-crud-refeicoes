defmodule Exmeal do
  alias Exmeal.Meals.Create, as: MealCreate
  alias Exmeal.Meals.Delete, as: MealDelete
  alias Exmeal.Meals.Get, as: MealGet
  alias Exmeal.Meals.Update, as: MealUpdate
  alias Exmeal.Users.Create, as: UserCreate
  alias Exmeal.Users.Delete, as: UserDelete

  defdelegate create_meal(params), to: MealCreate, as: :call
  defdelegate delete_meal(id), to: MealDelete, as: :call
  defdelegate get_meal_by_id(id), to: MealGet, as: :by_id
  defdelegate update_meal(params), to: MealUpdate, as: :call

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate delete_user(params), to: UserDelete, as: :call
end
