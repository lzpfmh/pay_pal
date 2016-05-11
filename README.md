# PayPal


This is a simple SDK of PayPal.
Currently, it's still under heavy developing.

It's a part of platform of [RiakC](https://riakc.com) which is a global payment gateway.

With [RiakC](https://riakc.com), everyone can get a localized payment page and localized payment methods easily.


## Installation

the package can be installed as:

  1. Add pay_pal to your list of dependencies in `mix.exs`:

        def deps do
          [{:pay_pal,github: "riakc/pay_pal"}]
        end

  2. Ensure pay_pal is started before your application:

        def application do
          [applications: [:pay_pal]]
        end


## Status

###Rest API

- Payment
  - [x] Create 
  - [x] Excute
  - [ ] Update

- Sale
  - [x] Lookup 
  - [x] Refund
  
- Refund
  - [x] Lookup 

- Webhook
  - [x] Create
  - [x] Update
  - [x] List
  - [x] Get 
  - [x] Delete

###Webhook
- Webook
  - [x] Verify
  - [ ] Sale Event

  