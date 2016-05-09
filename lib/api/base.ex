defmodule PayPal.Api.Base do

  defmacro __using__(_) do
    quote do
      require RiakcCommon.SimpleRest.Utils.ApiContext
      defp request_headers() do
        [{"Accept", "application/json"}, {"Content-Type", "application/json"}]
      end

      defp basic_headers() do
        [{"Accept", "application/json"}, {"Content-Type", "application/x-www-form-urlencoded"}]
      end

      defp handle_response(response) do
        case response do
          {:ok, %HTTPoison.Response{status_code: code, body: body}} ->
            cond do
              code in 200..299 ->
                {:ok, map} = Poison.decode(body, as: __MODULE__.__struct__)
              code == 401 ->
                {:ok, map} = Poison.decode(body, as: PayPal.Objects.Error.__struct__)
                {:auth_error, map}
              true ->
                {:ok, map} = Poison.decode(body, as: PayPal.Objects.Error.__struct__)
                {:api_error, map}
            end
          {:error, %HTTPoison.Error{reason: reason}} ->
            {:error, reason}
        end
      end

      defp context(target,headers \\ [], opts \\ []) do
        context = RiakcCommon.SimpleRest.Utils.ApiContext.new()
        %{context | target: target, headers: headers, 
          opts: opts, handler: &handle_response/1 }
      end

      def auth_context(target,opts \\ []) do
        headers = basic_headers()
        context(target,headers,opts)
      end
      def api_context(target,headers \\ [], opts \\ []) do
        default = request_headers()
        headers = Enum.concat(default,headers)
        context(target,headers,opts)
      end
      
    end
  end

end
