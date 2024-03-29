defmodule Msir.Repo.Migrations.CreateOrganizationTypes do
  use Ecto.Migration

  def change do
    create table(:organization_types) do
      add :name, :string
      add :description, :text

      timestamps()
    end
  end
end
