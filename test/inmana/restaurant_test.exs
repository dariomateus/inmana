defmodule Inmana.RestaurantTest do
  use Inmana.DataCase, async: true

  alias Ecto.Changeset
  alias Inmana.Restaurant

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Nome Restaurante", email: "nomerestaurante@gmail.com"}

      response = Restaurant.changeset(params)

      assert %Changeset{
               changes: %{email: "nomerestaurante@gmail.com", name: "Nome Restaurante"},
               valid?: true
             } = response
    end

    test "when all params are invalid, returns an invalid changeset" do
      params = %{name: "N", email: ""}

      expected_response = %{
        email: ["can't be blank"],
        name: ["should be at least 2 character(s)"]
      }

      response = Restaurant.changeset(params)

      assert %Changeset{valid?: false} = response

      assert errors_on(response) == expected_response
    end
  end
end
