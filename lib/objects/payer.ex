defmodule PayPal.Objects.Payer do
  use RiakcCommon.Data.JsonSchema
  use RiakcCommon.Data.JsonCodec

  json_schema do
    field :payment_method, :string, default: ""
    field :funding_instruments, :map, default: nil
    field :payer_info, PayPal.Objects.PayerInfo, default: nil
    field :status, :string, default: ""
  end
  
end