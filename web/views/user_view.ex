defmodule Nested.UserView do
  alias Nested.User
  alias Nested.Address
  use Nested.Web, :view

  def link_to_address_fields do
    changeset = User.changeset(%User{addresses: [%Address{}]})
    form = Phoenix.HTML.FormData.to_form(changeset, [])
    fields = render_to_string(__MODULE__, "address_fields.html", f: form)
    link "Add Address", to: "#", "data-template": fields, id: "add_address"
  end
end
