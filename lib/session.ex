defmodule Adyen.Session do
  @path "/sessions"

  alias Adyen.Operation

  def create_payment(params), do: Operation.new(:post, @path, params)
end
