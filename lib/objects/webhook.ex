defmodule PayPal.Objects.Webhook do
  use RiakcCommon.Data.JsonSchema
  use RiakcCommon.Data.JsonCodec

  json_schema do
    field :id, :string, default: ""
    field :url, :string, default: ""
    field :event_types, [PayPal.Objects.EventType], default: nil
    field :links, [PayPal.Objects.Link], default: nil
  end
    
end