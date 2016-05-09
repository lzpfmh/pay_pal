defmodule PayPal.Objects.Token do
  use RiakcCommon.Data.JsonSchema
  use RiakcCommon.Data.JsonCodec

  json_schema do
    field :scope, :string, default: ""
    field :access_token, :string, default: ""
    field :token_type, :string, default: ""
    field :expires_in, :integer, default: ""
  end
  
end