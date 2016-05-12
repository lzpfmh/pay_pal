defmodule PayPal.Api.SaleOperation do
  use PayPal.Api.Base
  use RiakcCommon.SimpleRest.Actions.CRUD, only: [:show],
   scope: {"payments",:singular},resource: "sale", method: :patch
  
  crud_schema do
    response PayPal.Objects.Sale
  end
  
  alias RiakcCommon.SimpleRest.Utils.API
  alias PayPal.Support.Http
  
  def refund(target,token,sale_id,amount,currency) do
    
    url = target <> "payments/sale/#{sale_id}/refund"
    headers = Http.headers(token)
    handler = fn(response) ->
      Http.handle_response(response,PayPal.Objects.Refund)
    end
    
    amount = %PayPal.Objects.Amount{amount: amount,currency: currency}
    data = %{"amount" => amount}

    json = Poison.encode!(data)
    API.post(url,json,handler,headers)
  end

end
