defmodule Adyen.Client do
  @type method :: :get | :post
  @type url :: binary()
  @type headers :: [{name :: binary(), value :: binary}]
  @type body :: binary()
  @type opts :: keyword()
  @callback request(
              method :: method(),
              url :: url(),
              headers :: headers(),
              body :: body(),
              opts :: opts()
            ) ::
              {:ok, integer(), keyword(), term()} | {:error, term()}
end
