defmodule PayPal.Objects.WebhookList do
  use RiakcCommon.Data.JsonSchema
  use RiakcCommon.Data.JsonCodec

  json_schema do
    field :webhooks, [PayPal.Objects.Webhook], default: nil
  end
    
end