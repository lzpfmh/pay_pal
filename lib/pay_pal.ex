defmodule PayPal do
  
  alias RiakcCommon.SimpleRest.Utils.API
  alias PayPal.Support.Http

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

end
