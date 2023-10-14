defmodule Exmeal.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Exmeal.Meal

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:name, :email, :document]

  @mail_regex ~r/^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/

  @derive {Jason.Encoder, only: @required_params ++ [:id, :inserted_at, :updated_at]}

  schema "users" do
    field :name, :string
    field :email, :string
    field :document, :string

    has_many :meals, Meal

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> validate(params)
  end

  def changeset(struct, params) do
    validate(struct, params)
  end

  defp validate(struct, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_format(:email, @mail_regex)
  end
end
