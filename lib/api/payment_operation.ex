defmodule PayPal.Api.PaymentOperation do
  use PayPal.Api.Base
  use RiakcCommon.SimpleRest.Actions.CRUD, except: [:delete],resource: "payment", method: :patch
  alias RiakcCommon.SimpleRest.Utils.API
  alias PayPal.Objects.PaymentResponse
  
  def execuate(target,token,invoice_id,payer_id) do
    header = [{"Authorization", "Bearer " <>  token}]
    url = target <> "payments/payment/#{invoice_id}/execute"
    context = api_context(url,PaymentResponse,header)
    data = Poison.encode!(%{payer_id: payer_id})
    API.post(context.target,data,&context.handler/1,context.headers)
  end

end
