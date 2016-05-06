defmodule PayPal.Objects.RedirectUrls do 
  
  use RiakcCommon.Data.JsonSchema
  use RiakcCommon.Data.JsonCodec

  json_schema do
    field return_url:, :string, default: ""
    field cancel_url:, :string, default: ""
  end

end