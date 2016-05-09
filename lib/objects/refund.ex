defmodule PayPal.Objects.Refund do
  use RiakcCommon.Data.JsonSchema
  use RiakcCommon.Data.JsonCodec

  json_schema do
    field :id, :string, default: ""
    field :amount, PayPal.Objects.Amount, default: nil
    field :create_time, :string, default: ""
    field :update_time, :string, default: ""
    field :state, :string, default: ""
    field :parent_payment, :string, default: ""
  end
  
end