defmodule PayPal.Objects.RelatedResource do
  use RiakcCommon.Data.JsonSchema
  use RiakcCommon.Data.JsonCodec

  json_schema do
    field :sale, PayPal.Objects.Sale, default: nil
    field :authorization, :map, default: nil
    field :capture, :map, default: nil
    field :refund, :map, default: nil
    field :order, :map, default: nil
  end
end