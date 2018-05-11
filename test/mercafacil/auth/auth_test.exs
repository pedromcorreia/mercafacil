defmodule Mercafacil.AuthTest do
  use Mercafacil.DataCase

  alias Mercafacil.Auth

  describe "clients" do
    alias Mercafacil.Auth.Client

    @valid_attrs %{name: "some name", user_type: "some user_type"}
    @update_attrs %{name: "some updated name", user_type: "some updated user_type"}
    @invalid_attrs %{name: nil, user_type: nil}

    def client_fixture(attrs \\ %{}) do
      {:ok, client} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_client()

      client
    end

    test "list_clients/0 returns all clients" do
      client = client_fixture()
      assert Auth.list_clients() == [client]
    end

    test "get_client!/1 returns the client with given id" do
      client = client_fixture()
      assert Auth.get_client!(client.id) == client
    end

    test "create_client/1 with valid data creates a client" do
      assert {:ok, %Client{} = client} = Auth.create_client(@valid_attrs)
      assert client.name == "some name"
      assert client.user_type == "some user_type"
    end

    test "create_client/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_client(@invalid_attrs)
    end

    test "update_client/2 with valid data updates the client" do
      client = client_fixture()
      assert {:ok, client} = Auth.update_client(client, @update_attrs)
      assert %Client{} = client
      assert client.name == "some updated name"
      assert client.user_type == "some updated user_type"
    end

    test "update_client/2 with invalid data returns error changeset" do
      client = client_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_client(client, @invalid_attrs)
      assert client == Auth.get_client!(client.id)
    end

    test "delete_client/1 deletes the client" do
      client = client_fixture()
      assert {:ok, %Client{}} = Auth.delete_client(client)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_client!(client.id) end
    end

    test "change_client/1 returns a client changeset" do
      client = client_fixture()
      assert %Ecto.Changeset{} = Auth.change_client(client)
    end
  end
end
