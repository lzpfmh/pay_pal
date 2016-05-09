defmodule PayPal.Api.Base do

  defmacro __using__(_) do
    quote do
      require RiakcCommon.SimpleRest.Utils.ApiContext
      require PayPal.Support.Http

      defp context(target,module,headers \\ [], opts \\ []) do
        context = RiakcCommon.SimpleRest.Utils.ApiContext.new()
        handler = fn(response) ->
             PayPal.Support.Http.handle_response(response,module)
          end
        %{context | target: target, headers: headers, 
          opts: opts, handler: handler }
      end

      def operate_with_token(target,token,restful_operation,opts \\ []) do
        headers = PayPal.Support.Http.headers(token)
        response = __MODULE__.__response__
        context = context(target,response,headers,opts)
        restful_operation.(context)
      end
      
    end
  end

end
