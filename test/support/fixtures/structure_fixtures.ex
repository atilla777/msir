defmodule Msir.StructureFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Msir.Structure` context.
  """

  @doc """
  Generate a organization_type.
  """
  def organization_type_fixture(attrs \\ %{}) do
    {:ok, organization_type} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> Msir.Structure.create_organization_type()

    organization_type
  end
end
