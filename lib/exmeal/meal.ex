defmodule Exmeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @required_params [:calories, :data, :description]

  schema "meals" do
    field :calories, :integer
    field :date, :naive_datetime
    field :description, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
  end
end
