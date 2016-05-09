defmodule PayPal.Api.SaleOperation do
  use PayPal.Api.Base
  use RiakcCommon.SimpleRest.Actions.CRUD, only: [:show],
   scope: {"payments",:singular},resource: "sale", method: :patch
  
  response PayPal.Objects.Sale

  alias RiakcCommon.SimpleRest.Utils.API
  alias PayPal.Support.Http
  
  def refund(target,token,sale_id,amount) do
    
    url = target <> "payments/payment/#{sale_id}/execute"
    headers = Http.headers(token)
    handler = fn(response) ->
      Http.handle_response(response,PayPal.Objects.Refund)
    end
    data = Poison.encode!(amount)

    API.post(url,data,handler,headers)
  end

end
