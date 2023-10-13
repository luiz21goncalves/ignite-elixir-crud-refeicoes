defmodule Exmeal.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :document, :string

      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:document])
  end
end
