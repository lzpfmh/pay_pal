defmodule PayPal.Objects.Error do
  use RiakcCommon.Data.JsonSchema
  use RiakcCommon.Data.JsonCodec

  json_schema do
    field :name, :string, default: ""
    field :message, :string, default: ""
    field :information_link, :string, default: ""
    field :details, :string, default: ""
  end
    
end