defmodule MsirWeb.OrganizationTypeLive.Index do
  use MsirWeb, :live_view

  alias Msir.Structure
  alias Msir.Structure.OrganizationType

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :organization_types, list_organization_types())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Organization type")
    |> assign(:organization_type, Structure.get_organization_type!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Organization type")
    |> assign(:organization_type, %OrganizationType{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Organization types")
    |> assign(:organization_type, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    organization_type = Structure.get_organization_type!(id)
    {:ok, _} = Structure.delete_organization_type(organization_type)

    {:noreply, assign(socket, :organization_types, list_organization_types())}
  end

  defp list_organization_types do
    Structure.list_organization_types()
  end
end
