defmodule PayPal.Api.AuthOperation do
  use PayPal.Api.Base
  use RiakcCommon.SimpleRest.Actions.CRUD, 
    only: [:create], scope: {"oauth2",:singular},resource: "token"

  alias PayPal.Objects.Token


  def auth(target,client_id,secret) do
    hackney = [basic_auth: {client_id, secret}]
    context = auth_context(target,Token,[hackney: hackney])
    data = "grant_type=client_credentials"
    create(data,context)
  end

end
