defmodule PayPal.Support.Http do
  
  alias RiakcCommon.Data.JsonCodec

  def handle_response(response,module) do
    error = JsonCodec.version_type(PayPal.Objects.Error)
    case response do
      {:ok, %HTTPoison.Response{status_code: code, body: body}} ->
        cond do
          code in 200..299 ->
            {:ok, map} = Poison.decode(body)
            type = JsonCodec.version_type(module)
            struct =  Poison.Decode.decode(map,as: type)
            {:ok,struct}
          code == 401 ->
            {:ok, map} = Poison.decode(body, as: error)
            {:auth_error, map}
          true ->
            {:ok, map} = Poison.decode(body, as: error)
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