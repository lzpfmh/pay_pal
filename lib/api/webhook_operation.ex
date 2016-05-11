defmodule PayPal.Api.WebhookOperation do
  use PayPal.Api.Base
  use RiakcCommon.SimpleRest.Actions.CRUD,
   scope: {"notifications",:singular},resource: "webhooks", method: :patch
  
  crud_schema do
    response PayPal.Objects.Webhook
    response PayPal.Objects.WebhookList, [:index]
    requset PayPal.Objects.Webhook [:create]
  end
end
