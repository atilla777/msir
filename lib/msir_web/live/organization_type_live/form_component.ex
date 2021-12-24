defmodule MsirWeb.OrganizationTypeLive.FormComponent do
  use MsirWeb, :live_component

  alias Msir.Structure

  @impl true
  def update(%{organization_type: organization_type} = assigns, socket) do
    changeset = Structure.change_organization_type(organization_type)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"organization_type" => organization_type_params}, socket) do
    changeset =
      socket.assigns.organization_type
      |> Structure.change_organization_type(organization_type_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"organization_type" => organization_type_params}, socket) do
    save_organization_type(socket, socket.assigns.action, organization_type_params)
  end

  defp save_organization_type(socket, :edit, organization_type_params) do
    case Structure.update_organization_type(socket.assigns.organization_type, organization_type_params) do
      {:ok, _organization_type} ->
        {:noreply,
         socket
         |> put_flash(:info, "Organization type updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_organization_type(socket, :new, organization_type_params) do
    case Structure.create_organization_type(organization_type_params) do
      {:ok, _organization_type} ->
        {:noreply,
         socket
         |> put_flash(:info, "Organization type created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
