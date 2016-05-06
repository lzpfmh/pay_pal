defmodule PayPal.Objects.ShippingAddress do
  use RiakcCommon.Data.JsonSchema
  use RiakcCommon.Data.JsonCodec

  json_schema do
    field :recipient_name, :string, default: ""
    field :type, :string, default: ""
    field :line1, :string, default: ""
    field :line2, :string, default: ""
    field :city, :string, default: ""
    field :country_code, :string, default: ""
    field :postal_code, :string, default: ""
    field :state, :string, default: ""
    field :phone, :string, default: ""
  end

end