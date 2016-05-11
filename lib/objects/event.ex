defmodule PayPal.Objects.Event do
  use RiakcCommon.Data.JsonSchema
  use RiakcCommon.Data.JsonCodec

  json_schema do
    field :id, :string, default: ""
    field :create_time, :string, default: ""
    field :resource_type, :string, default: ""
    field :event_type, :string, default: ""
    field :summary,  :string, default: ""
    field :resource, :map, default: nil
    field :links, [PayPal.Objects.Link], default: nil
    field :event_version, :string, default: ""
  end
    
end