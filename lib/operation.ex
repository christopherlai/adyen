defmodule Adyen.Operation do
  @type method :: :get | :post
  @type t :: %__MODULE__{
          path: binary(),
          method: method(),
          body: map()
        }

  defstruct [:path, :method, :body]

  def new(method, path, body) do
    struct(__MODULE__, method: method, path: path, body: body)
  end
end
