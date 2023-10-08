defmodule Exmeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:calories, :date, :description]

  @derive {Jason.Encoder, only: [:id, :calories, :date, :description, :inserted_at, :updated_at]}

  schema "meals" do
    field :calories, :integer
    field :date, :date
    field :description, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
  end
end
