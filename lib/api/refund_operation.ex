defmodule PayPal.Api.RefundOperation do
  use PayPal.Api.Base
  use RiakcCommon.SimpleRest.Actions.CRUD, only: [:show],
   scope: {"payments",:singular},resource: "refund", method: :patch

  crud_schema do
    response PayPal.Objects.Refund
  end
end
