defmodule AppPhx.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias AppPhx.Accounts.User
  alias Comeonin.Bcrypt

  schema "users" do
    field :password, :string
    field :username, :string
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password])
    |> validate_required([:username, :password])
    |> unique_constraint(:username)
    |> validate_confirmation(:password)
    |> update_change(:password, &Bcrypt.hashpwsalt/1)
  end
end
