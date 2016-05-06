defmodule PayPal.Objects.PayerInfo do
  use RiakcCommon.Data.JsonSchema
  use RiakcCommon.Data.JsonCodec

  json_schema do
    field :email, :string, default: ""
    field :salutation, :string, default: ""
    field :first_name, :string, default: ""
    field :middle_name, :string, default: ""
    field :last_name, :string, default: ""
    field :suffix, :string, default: ""
    field :payer_id, :string, default: ""
    field :phone, :string, default: ""
    field :country_code, :string, default: ""
    field :shipping_address, PayPal.Objects.ShippingAddress, default: nil
    field :tax_id_type, :string, default: ""
    field :tax_id, :string, default: ""
  end

end