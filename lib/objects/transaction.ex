defmodule PayPal.Objects.Transaction do
  use RiakcCommon.Data.JsonSchema
  use RiakcCommon.Data.JsonCodec

  json_schema do
    field :amount, PayPal.Objects.Amount, default: nil
    field :item_list, PayPal.Objects.ItemList, default: nil
    field :related_resources, [PayPal.Objects.RelatedResource], default: nil
    field :description, :string, default: ""
    field :invoice_number, :string, default: ""
    field :custom, :string, default: ""
    field :soft_descriptor, :string, default: ""
    field :payment_options, :map, default: nil
  end
    
end