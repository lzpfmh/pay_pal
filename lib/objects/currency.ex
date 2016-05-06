defmodule PayPal.Objects.Currency do
  use RiakcCommon.Data.JsonSchema
  use RiakcCommon.Data.JsonCodec

  json_schema do
    field :currency, :string, default: ""
    field :value, :string, default: ""
  end
    
end