defmodule PayPal do
  
  alias RiakcCommon.SimpleRest.Utils.API
  alias PayPal.Support.Http
  
  use PayPal.Support.Constants, as: C

  def authentication(target,client_id,secret) do
    hackney = [basic_auth: {client_id, secret}]
    headers = [
      {"Accept", "application/json"},
      {"Content-Type", "application/x-www-form-urlencoded"}
    ]
    data = "grant_type=client_credentials"
    url = target <> "oauth2/token"
    
    handler = fn(response) ->
      Http.handle_response(response,PayPal.Objects.Token)
    end

    API.post(url,data,handler,headers,[hackney: hackney])
  end

  def endpoint(mode) do
    case mode do
      C.mode_test ->
        "https://api.sandbox.paypal.com/v1/"
      C.mode_prod ->
        "https://api.paypal.com/v1/"
      _ ->
        nil
    end
  end

  def site(mode) do
    case mode do
      C.mode_test ->
        "https://www.sandbox.paypal.com"
      C.mode_prod ->
        "https://www.paypal.com"
      _ ->
        nil
    end
  end

  def readable_name(), do: "PayPal"
  def downcase_name(), do: "paypal"

end
