defmodule Nested.User do
  use Nested.Web, :model

  schema "users" do
    field :name, :string

    has_many :addresses, Nested.Address

    timestamps
  end

  @required_fields ~w(name addresses)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
