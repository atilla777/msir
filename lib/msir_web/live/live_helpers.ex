defmodule MsirWeb.LiveHelpers do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers

  alias Phoenix.LiveView.JS

  @doc """
  Renders a live component inside a modal.

  The rendered modal receives a `:return_to` option to properly update
  the URL when the modal is closed.

  ## Examples

      <.modal return_to={Routes.organization_type_index_path(@socket, :index)}>
        <.live_component
          module={MsirWeb.OrganizationTypeLive.FormComponent}
          id={@organization_type.id || :new}
          title={@page_title}
          action={@live_action}
          return_to={Routes.organization_type_index_path(@socket, :index)}
          organization_type: @organization_type
        />
      </.modal>
  """
  def modal(assigns) do
    assigns = assign_new(assigns, :return_to, fn -> nil end)

    ~H"""
    <div id="modal" x-data="{modalOpen: true}" x-bind:class="{'modal-open': modalOpen}" class="modal" phx-remove={hide_modal()}>
      <div
        id="modal-content"
        class="modal-box max-w-screen-lg"
        phx-click-away={JS.dispatch("click", to: "#close")}
        phx-window-keydown={JS.dispatch("click", to: "#close")}
        phx-key="escape"
      >
        <%= if @return_to do %>
          <%= live_patch to: @return_to,
            id: "close",
            class: "phx-modal-close",
            phx_click: hide_modal()
            do
          %>
             <div  class="btn btn-circle btn-md btn-ghost text-3xl">
               <i class="fa-solid fa-xmark"></i>
             </div>
          <% end %>
        <% else %>
         <a id="close" href="#" class="phx-modal-close" phx-click={hide_modal()}>✖</a>
        <% end %>

        <%= render_slot(@inner_block) %>
      </div>
    </div>
    """

    # TODO: use or remove code below
    # ~H"""
    # <div id="modal" class="phx-modal fade-in" phx-remove={hide_modal()}>
    #   <div
    #     id="modal-content"
    #     class="phx-modal-content fade-in-scale"
    #     phx-click-away={JS.dispatch("click", to: "#close")}
    #     phx-window-keydown={JS.dispatch("click", to: "#close")}
    #     phx-key="escape"
    #   >
    #     <%= if @return_to do %>
    #       <%= live_patch "✖",
    #         to: @return_to,
    #         id: "close",
    #         class: "phx-modal-close",
    #         phx_click: hide_modal()
    #       %>
    #     <% else %>
    #      <a id="close" href="#" class="phx-modal-close" phx-click={hide_modal()}>✖</a>
    #     <% end %>

    #     <%= render_slot(@inner_block) %>
    #   </div>
    # </div>
    # """
  end

  defp hide_modal(js \\ %JS{}) do
    js
    |> JS.hide(to: "#modal", transition: "fade-out")
    |> JS.hide(to: "#modal-content", transition: "fade-out-scale")
  end
end
