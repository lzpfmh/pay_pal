defmodule PayPal.Api.WebhookOperation do
  use PayPal.Api.Base
  use RiakcCommon.SimpleRest.Actions.CRUD,
   scope: {"notifications",:singular},resource: "webhooks", method: :patch
  
  response PayPal.Objects.Webhook

end
