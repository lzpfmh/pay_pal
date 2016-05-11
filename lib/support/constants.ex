defmodule PayPal.Support.Constants do
  use RiakcCommon.Tools.Constants

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


  define event_sale_completed,"PAYMENT.SALE.COMPLETED"
  define event_sale_denied,"PAYMENT.SALE.DENIED"
  define event_sale_pending,"PAYMENT.SALE.PENDING"
  define event_sale_refunded,"PAYMENT.SALE.REFUNDED"
  define event_sale_reversed,"PAYMENT.SALE.REVERSED"


end