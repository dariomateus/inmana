defmodule InmanaWeb.RestaurantsViewTest do
  use InmanaWeb.ConnCase, async: true

  import Phoenix.View

  alias InmanaWeb.RestaurantsView
  alias Inmana.Restaurant

  describe "render/2" do
    test "renders create.json" do
      params = %{name: "Nome Restaurante", email: "nomerestaurante@gmail.com"}
      {:ok, restaurant} = Inmana.create_restaurant(params)

      response = render(RestaurantsView, "create.json", restaurant: restaurant)

      assert %{
               message: "Restaurant created!",
               restaurant: %Restaurant{
                 email: "nomerestaurante@gmail.com",
                 id: _id,
                 name: "Nome Restaurante"
               }
             } = response
    end
  end
end
