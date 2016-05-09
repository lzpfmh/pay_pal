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

      defp handle_response(response,module) do
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

      defp context(target,module,headers \\ [], opts \\ []) do
        context = RiakcCommon.SimpleRest.Utils.ApiContext.new()
        handler = fn(response) ->
            handle_response(response,module)
          end
        %{context | target: target, headers: headers, 
          opts: opts, handler: handler }
      end

      def auth_context(target,module,opts \\ []) do
        headers = basic_headers()
        context(target,module,headers,opts)
      end
      
      def api_context(target,module,headers \\ [], opts \\ []) do
        default = request_headers()
        headers = Enum.concat(default,headers)
        context(target,module,headers,opts)
      end
      
    end
  end

end
