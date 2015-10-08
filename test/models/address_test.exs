defmodule Nested.AddressTest do
  use Nested.ModelCase

  alias Nested.Address

  @valid_attrs %{street: "some content", type: "some content", zip: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Address.changeset(%Address{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Address.changeset(%Address{}, @invalid_attrs)
    refute changeset.valid?
  end
end
