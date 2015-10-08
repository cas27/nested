defmodule Nested.Repo.Migrations.CreateAddress do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add :type, :string
      add :street, :string
      add :zip, :string
      add :user_id, references(:users)

      timestamps
    end
    create index(:addresses, [:user_id])

  end
end
