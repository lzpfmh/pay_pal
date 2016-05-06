defmodule RiakcPay.PayPal.Objects.Link do
  use RiakcCommon.Data.JsonSchema
  use RiakcCommon.Data.JsonCodec

  json_schema do
    field href:, :string, default: ""
    field rel:, :string, default: ""
    field method:, :string, default: ""
  end
  
end