defmodule Adyen.HackneyClient do
  @behaviour Adyen.Client

  def request(method, url, headers, body, opts \\ []) do
    response = :hackney.request(method, url, headers, body, opts || [with_body: true])

    case response do
      {:ok, _status, _headers, _body} = data -> data
      {:ok, status, headers} -> {:ok, status, headers, ""}
      other -> other
    end
  end
end
