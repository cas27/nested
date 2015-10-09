defmodule Nested.Address do
  use Nested.Web, :model

  schema "addresses" do
    field :type, :string
    field :street, :string
    field :zip, :string
    field :delete, :boolean, virtual: true
    belongs_to :user, Nested.User

    timestamps
  end

  @required_fields ~w(type street zip)
  @optional_fields ~w(delete)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> set_delete_action
  end

  defp set_delete_action(changeset) do
    if get_change(changeset, :delete) do
      %{changeset | action: :delete}
    else
      changeset
    end
  end
end
