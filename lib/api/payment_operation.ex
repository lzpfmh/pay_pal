defmodule PayPal.Api.PaymentOperation do
  use PayPal.Api.Base
  use RiakcCommon.SimpleRest.Actions.CRUD, except: [:delete],
   scope: {"payments",:singular},resource: "payment", method: :patch

  alias RiakcCommon.SimpleRest.Utils.API
  alias PayPal.Support.Http
  
  crud_schema do
    response PayPal.Objects.Payment
  end
  
  def execute(target,token,invoice_id,payer_id) do
    url = target <> "payments/payment/#{invoice_id}/execute"
    headers = Http.headers(token)
    handler = fn(response) ->
      Http.handle_response(response, __MODULE__.__response__)
    end
    data = Poison.encode!(%{payer_id: payer_id})

    API.post(url,data,handler,headers)
  end


end
