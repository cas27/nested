defmodule Nested.Address do
  use Nested.Web, :model

  schema "addresses" do
    field :type, :string
    field :street, :string
    field :zip, :string
    belongs_to :user, Nested.User

    timestamps
  end

  @required_fields ~w(type street zip)
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
