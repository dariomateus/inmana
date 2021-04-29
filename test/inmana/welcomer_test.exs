defmodule Inmana.WelcomerTest do
  use ExUnit.Case, async: true

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when the user is special, returns a special message" do
      params = %{"name" => "dario", "age" => "30"}
      expected_result = {:ok, "You are very special Dario"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is not special, returns a message" do
      params = %{"name" => "João", "age" => "32"}
      expected_result = {:ok, "Welcome joão"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is underage, returns a message" do
      params = %{"name" => "João", "age" => "15"}
      expected_result = {:error, "You shall not pass joão"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end
  end
end
