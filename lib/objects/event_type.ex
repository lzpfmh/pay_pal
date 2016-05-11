defmodule PayPal.Objects.EventType do
  use RiakcCommon.Data.JsonSchema
  use RiakcCommon.Data.JsonCodec

  json_schema do
    field :name, :string , default: ""
    field :description, :string, default: ""
  end

end
