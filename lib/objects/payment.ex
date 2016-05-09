defmodule PayPal.Objects.Payment do
  use RiakcCommon.Data.JsonSchema
  use RiakcCommon.Data.JsonCodec

  json_schema do
    field :intent, :string, default: ""
    field :payer, PayPal.Objects.Payer, default: nil
    field :transactions, [PayPal.Objects.Transaction], default: nil
    field :redirect_urls, [PayPal.Objects.RedirectUrls], default: nil
    field :id, :string, default: ""
    field :create_time, :string, default: ""
    field :update_time, :string, default: ""
    field :state, :string, default: ""
    field :links, [PayPal.Objects.Link], default: nil
    field :experience_profile_id, :string, default: ""
  end
    
end