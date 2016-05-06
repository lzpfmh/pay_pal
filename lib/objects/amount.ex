defmodule PayPal.Objects.Amount do
  use RiakcCommon.Data.JsonSchema
  use RiakcCommon.Data.JsonCodec

  json_schema do
    field :currency, :string, default: ""
    field :total, :string, default: ""
    field :details, [PayPal.Objects.Detail], default: nil
  end
    
end