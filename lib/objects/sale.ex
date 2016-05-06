defmodule PayPal.Objects.Sale do
  use RiakcCommon.Data.JsonSchema
  use RiakcCommon.Data.JsonCodec

  json_schema do
    field :id, :string, default: ""
    field :amount, PayPal.Objects.Amount, default: nil
    field :description, :string, default: ""
    field :create_time, :string, default: ""
    field :update_time, :string, default: ""
    field :state, :string, default: ""
    field :parent_payment, :string, default: ""
    field :payment_mode, :string, default: ""
    field :reason_code, :string, default: ""
    field :clearing_time, :string, default: ""
    field :transaction_fee, PayPal.Objects.Currency, default: nil
    field :receivable_amount, PayPal.Objects.Currency, default: nil
    field :exchange_rate, :string, default: ""
    field :fmf_details, :map, default: nil
    field :receipt_id, :string, default: ""
    field :protection_eligibility, :string, default: ""
    field :protection_eligibility_type, :string, default: ""
    field :links, [PayPal.Objects.Link], default: nil
  end
    
end