defmodule PayPal.Api.Payment do
  use PayPal.Api.Base
  use RiakcCommon.SimpleRest.Actions.CRUD, except: [:delete],resource: "payment", method: :patch

end
