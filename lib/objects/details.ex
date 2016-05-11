defmodule PayPal.Objects.Details do
  use RiakcCommon.Data.JsonSchema
  use RiakcCommon.Data.JsonCodec

  json_schema do
    field :shipping, :string, default: ""
    field :subtotal, :string, default: ""
    field :tax, :string, default: ""
    field :handling_fee, :string, default: ""
    field :insurance, :string, default: ""
    field :shipping_discount, :string, default: ""
  end
    
end