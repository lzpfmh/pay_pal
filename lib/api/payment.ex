defmodule PayPal.Api.Payment do
  use PayPal.Api.Base
  use RiakcCommon.SimpleRest.Actions.CRUD, except: [:delete],resource: "payment", method: :patch
  alias RiakcCommon.SimpleRest.Utils.API
  
  def execuate(target,token,invoice_id,payer_id) do
    header = [{"Authorization", "Bearer " <>  token}]
    url = target <> "payments/payment/#{invoice_id}/execute"
    context = api_context(url,header)
    data = Poison.encode!(%{payer_id: payer_id})
    API.post(context.target,data,&handle_response/1,context.headers)
  end

end
