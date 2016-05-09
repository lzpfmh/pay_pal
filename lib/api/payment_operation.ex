defmodule PayPal.Api.PaymentOperation do
  use PayPal.Api.Base
  use RiakcCommon.SimpleRest.Actions.CRUD, except: [:delete],
   scope: {"payments",:singular},resource: "payment", method: :patch

  alias RiakcCommon.SimpleRest.Utils.API
  alias PayPal.Objects.PaymentResponse
  alias PayPal.Support.Http
  
  def execute(target,token,invoice_id,payer_id) do
    url = target <> "payments/payment/#{invoice_id}/execute"
    headers =  [
          {"Authorization", "Bearer " <> token},
          {"Accept", "application/json"},
          {"Content-Type", "application/json"}
        ]

    handler = fn(response) ->
      Http.handle_response(response,PaymentOperation)
    end
    data = Poison.encode!(%{payer_id: payer_id})

    API.post(url,data,handler,headers)
  end

  response PayPal.Objects.PaymentResponse


end
