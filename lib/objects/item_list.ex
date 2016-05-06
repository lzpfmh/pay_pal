defmodule PayPal.Objects.ItemList do
  use RiakcCommon.Data.JsonSchema
  use RiakcCommon.Data.JsonCodec

  json_schema do
    field :items, [PayPal.Objects.Item], default: nil
    field :shipping_address, PayPal.Objects.ShippingAddress, default: nil
  end

end
