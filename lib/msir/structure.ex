defmodule Msir.Structure do
  @moduledoc """
  The Structure context.
  """

  import Ecto.Query, warn: false
  alias Msir.Repo

  alias Msir.Structure.OrganizationType

  @doc """
  Returns the list of organization_types.

  ## Examples

      iex> list_organization_types()
      [%OrganizationType{}, ...]

  """
  def list_organization_types do
    Repo.all(OrganizationType)
  end

  @doc """
  Gets a single organization_type.

  Raises `Ecto.NoResultsError` if the Organization type does not exist.

  ## Examples

      iex> get_organization_type!(123)
      %OrganizationType{}

      iex> get_organization_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_organization_type!(id), do: Repo.get!(OrganizationType, id)

  @doc """
  Creates a organization_type.

  ## Examples

      iex> create_organization_type(%{field: value})
      {:ok, %OrganizationType{}}

      iex> create_organization_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_organization_type(attrs \\ %{}) do
    %OrganizationType{}
    |> OrganizationType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a organization_type.

  ## Examples

      iex> update_organization_type(organization_type, %{field: new_value})
      {:ok, %OrganizationType{}}

      iex> update_organization_type(organization_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_organization_type(%OrganizationType{} = organization_type, attrs) do
    organization_type
    |> OrganizationType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a organization_type.

  ## Examples

      iex> delete_organization_type(organization_type)
      {:ok, %OrganizationType{}}

      iex> delete_organization_type(organization_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_organization_type(%OrganizationType{} = organization_type) do
    Repo.delete(organization_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking organization_type changes.

  ## Examples

      iex> change_organization_type(organization_type)
      %Ecto.Changeset{data: %OrganizationType{}}

  """
  def change_organization_type(%OrganizationType{} = organization_type, attrs \\ %{}) do
    OrganizationType.changeset(organization_type, attrs)
  end
end
