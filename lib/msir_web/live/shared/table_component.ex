defmodule MsirWeb.TableComponent do
  use MsirWeb, :live_component
  import MsirWeb.TableHelpers

  def update(assigns, socket) do
    {:ok,
      socket
      |> assign(:displayed_fields, displayed_fields(assigns.table_options.schema, assigns.table_options.fields))
      |> assign(:records, assigns.table_options.records)
      |> assign(:socket, socket)
    }
  end

  defp displayed_fields(schema, fields) do
    schema.__schema__(:fields)
    |> select_fields(fields)

  end

  defp select_fields(fields, %{only: only} ) do
    fields
    |> Enum.filter(&only_filter(&1, only))
  end

  defp select_fields(fields, %{except: except} ) do
    fields
    |> Enum.filter(&except_filter(&1, except))
  end

  defp select_fields(fields, _) do
    fields
  end

  defp only_filter(field, only) do
    Enum.member?(only, field)
  end

  defp except_filter(field, except) do
    !Enum.member?(except, field)
  end

end
