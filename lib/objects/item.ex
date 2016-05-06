defmodule PayPal.Objects.Item do
  use RiakcCommon.Data.JsonSchema
  use RiakcCommon.Data.JsonCodec

  json_schema do
    field :quantity, :string, default: ""
    field :name, :string, default: ""
    field :price, :string, default: ""
    field :currency, :string, default: ""
    field :sku, :string, default: ""
    field :description, :string, default: ""
    field :text, :string, default: ""
  end
    
end