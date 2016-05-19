defmodule PayPal.Support.Constants do
  use RiakcCommon.Tools.Constants


  define mode_test, "test"
  define mode_prod, "prod"

  define intent_sale,"sale"
  define intent_authorize,"authorize"
  define intent_order,"order"

  define state_created,"created"
  define state_approved,"approved"
  define state_failed,"failed"
  define state_canceled,"canceled"
  define state_expired,"expired"
  define state_pending,"pending"
  define state_in_progress,"in_progress"
  define state_completed, "completed"
  define state_partially_refunded,"partially_refunded"


  define event_sale_completed,"PAYMENT.SALE.COMPLETED"
  define event_sale_denied,"PAYMENT.SALE.DENIED"
  define event_sale_pending,"PAYMENT.SALE.PENDING"
  define event_sale_refunded,"PAYMENT.SALE.REFUNDED"
  define event_sale_reversed,"PAYMENT.SALE.REVERSED"

  defmacro __using__(opts) do
    as = Keyword.get(opts, :as,nil)
    code = 
      if nil == as do
        quote do
          require PayPal.Support.Constants
          alias PayPal.Support.Constants
        end
      else
        quote do
          require PayPal.Support.Constants
          alias PayPal.Support.Constants, as: unquote(as)
        end
      end

    quote do
      unquote(code)
    end

  end

end