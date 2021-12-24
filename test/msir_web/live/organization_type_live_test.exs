defmodule MsirWeb.OrganizationTypeLiveTest do
  use MsirWeb.ConnCase

  import Phoenix.LiveViewTest
  import Msir.StructureFixtures

  @create_attrs %{description: "some description", name: "some name"}
  @update_attrs %{description: "some updated description", name: "some updated name"}
  @invalid_attrs %{description: nil, name: nil}

  defp create_organization_type(_) do
    organization_type = organization_type_fixture()
    %{organization_type: organization_type}
  end

  describe "Index" do
    setup [:create_organization_type]

    test "lists all organization_types", %{conn: conn, organization_type: organization_type} do
      {:ok, _index_live, html} = live(conn, Routes.organization_type_index_path(conn, :index))

      assert html =~ "Listing Organization types"
      assert html =~ organization_type.description
    end

    test "saves new organization_type", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.organization_type_index_path(conn, :index))

      assert index_live |> element("a", "New Organization type") |> render_click() =~
               "New Organization type"

      assert_patch(index_live, Routes.organization_type_index_path(conn, :new))

      assert index_live
             |> form("#organization_type-form", organization_type: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#organization_type-form", organization_type: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.organization_type_index_path(conn, :index))

      assert html =~ "Organization type created successfully"
      assert html =~ "some description"
    end

    test "updates organization_type in listing", %{conn: conn, organization_type: organization_type} do
      {:ok, index_live, _html} = live(conn, Routes.organization_type_index_path(conn, :index))

      assert index_live |> element("#organization_type-#{organization_type.id} a", "Edit") |> render_click() =~
               "Edit Organization type"

      assert_patch(index_live, Routes.organization_type_index_path(conn, :edit, organization_type))

      assert index_live
             |> form("#organization_type-form", organization_type: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#organization_type-form", organization_type: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.organization_type_index_path(conn, :index))

      assert html =~ "Organization type updated successfully"
      assert html =~ "some updated description"
    end

    test "deletes organization_type in listing", %{conn: conn, organization_type: organization_type} do
      {:ok, index_live, _html} = live(conn, Routes.organization_type_index_path(conn, :index))

      assert index_live |> element("#organization_type-#{organization_type.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#organization_type-#{organization_type.id}")
    end
  end

  describe "Show" do
    setup [:create_organization_type]

    test "displays organization_type", %{conn: conn, organization_type: organization_type} do
      {:ok, _show_live, html} = live(conn, Routes.organization_type_show_path(conn, :show, organization_type))

      assert html =~ "Show Organization type"
      assert html =~ organization_type.description
    end

    test "updates organization_type within modal", %{conn: conn, organization_type: organization_type} do
      {:ok, show_live, _html} = live(conn, Routes.organization_type_show_path(conn, :show, organization_type))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Organization type"

      assert_patch(show_live, Routes.organization_type_show_path(conn, :edit, organization_type))

      assert show_live
             |> form("#organization_type-form", organization_type: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#organization_type-form", organization_type: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.organization_type_show_path(conn, :show, organization_type))

      assert html =~ "Organization type updated successfully"
      assert html =~ "some updated description"
    end
  end
end
