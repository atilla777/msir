defmodule MsirWeb.TableHelpers do
  use MsirWeb, :live_view

  def table_head(assigns) do
    ~H"""
    <thead>
      <tr>
        <%= for field <- @displayed_fields do %>
          <th>
            <%= field %>
          </th>
        <% end %>

        <th></th>
      </tr>
    </thead>
    """
  end

  def table_row(assigns) do
    record = assigns.record
    ~H"""
    <tr id={"record-#{record.id}"} class="hover">
      <%= for field <- @displayed_fields do %>
        <td><%= Map.get(record, field) %></td>
      <% end %>

      <td class="flex justify-end space-x-4">
        <span class="text-primary">
          <%= live_redirect to: Routes.organization_type_show_path(@socket, :show, record) do %>
            <div data-tip="Показать" class="tooltip">
              <i class="fa-solid fa-eye"></i>
            </div>
          <% end %>
        </span>
        <span class="text-primary">
          <%= live_patch to: Routes.organization_type_index_path(@socket, :edit, record) do %>
            <div data-tip="Редактировать" class="tooltip">
              <i class="fa-solid fa-pen"></i>
            </div>
          <% end %>
        </span>
        <span class="text-primary">
          <%= link to: "#", phx_click: "delete", phx_value_id: record.id, data: [confirm: "Are you sure?"] do %>
            <div data-tip="Удалить" class="tooltip">
              <i class="fa-solid fa-trash"></i>
            </div>
          <% end %>
        </span>
      </td>
    </tr>
    """
  end
end
