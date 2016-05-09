defmodule PayPal.Support.Http do

  def handle_response(response,module) do
    case response do
      {:ok, %HTTPoison.Response{status_code: code, body: body}} ->
        cond do
          code in 200..299 ->
            {:ok, map} = Poison.decode(body, as: module)
          code == 401 ->
            {:ok, map} = Poison.decode(body, as: PayPal.Objects.Error)
            {:auth_error, map}
          true ->
            {:ok, map} = Poison.decode(body, as: PayPal.Objects.Error)
            {:api_error, map}
        end

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end


  def headers(token) do
    [
      {"Authorization", "Bearer " <> token},
      {"Accept", "application/json"},
      {"Content-Type", "application/json"}
    ]
  end

end