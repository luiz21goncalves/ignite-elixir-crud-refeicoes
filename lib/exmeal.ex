defmodule Exmeal do
  alias Exmeal.Meals.Create, as: MealCreate

  defdelegate create_meal(params), to: MealCreate, as: :call
end
