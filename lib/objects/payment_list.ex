defmodule PayPal.Objects.PaymentList do
  use RiakcCommon.Data.JsonSchema
  use RiakcCommon.Data.JsonCodec

  json_schema do
    field :payments, [PayPal.Objects.Payment], default: nil
  end
    
end