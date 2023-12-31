defmodule Exmeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  alias Exmeal.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:calories, :date, :description, :user_id]

  @derive {Jason.Encoder, only: @required_params ++ [:id, :inserted_at, :updated_at]}

  schema "meals" do
    field :calories, :integer
    field :date, :date
    field :description, :string

    belongs_to :user, User

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> validate(params)
  end

  def changeset(struct, params) do
    struct
    |> validate(params)
  end

  defp validate(struct, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
