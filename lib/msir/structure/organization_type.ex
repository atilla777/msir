defmodule Msir.Structure.OrganizationType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "organization_types" do
    field :name, :string
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(organization_type, attrs) do
    organization_type
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
