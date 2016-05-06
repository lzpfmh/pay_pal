defmodule PayPal.Api.Auth do
  use PayPal.Api.Base
  use RiakcCommon.SimpleRest.Actions.CRUD, 
    only: [:create], scope: {"oauth2",:singular},resource: "token"

  use RiakcCommon.Data.JsonSchema
  use RiakcCommon.Data.JsonCodec

  json_schema do
    field :scope, :string, default: ""
    field :access_token, :string, default: ""
    field :token_type, :string, default: ""
    field :expires_in, :integer, default: ""
  end

  def auth(target,client_id,secret) do
    hackney = [basic_auth: {client_id, secret}]
    context = auth_context(target,[hackney: hackney])
    data = "grant_type=client_credentials"
    create(data,context)
  end

end
