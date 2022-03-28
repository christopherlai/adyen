defmodule Adyen do
  def request(operation, opts \\ []) do
    client = client(opts)
    json = json_library(opts)
    url = [api_url(opts), api_version(opts), operation.path] |> Enum.join("/")

    headers = [
      {"Content-Type", "application/json"},
      {"x-API-key", api_key(opts)}
    ]

    body = json.encode!(operation.body)

    client_opts = opts[:client_opts] || []

    response = client.request(operation.method, url, headers, body, client_opts)

    with {:ok, status, headers, body} <- response,
         {:ok, content} <- json.decode(body) do
      {:ok, status, headers, content}
    end
  end

  defp client(http_client: client), do: client
  defp client(_), do: Application.get_env(:adyen, :http_client, Adyen.HackneyClient)

  defp json_library(json_library: library), do: library
  defp json_library(_), do: Application.get_env(:adyen, :json_library, Jason)

  defp api_url(api_url: url), do: url
  defp api_url(_), do: Application.get_env(:adyen, :api_url, "")

  defp api_version(api_version: api_version), do: api_version
  defp api_version(_), do: Application.get_env(:adyen, :api_url, "v68")

  defp api_key(api_key: api_key), do: api_key
  defp api_key(_), do: Application.get_env(:adyen, :api_url, "")
end
