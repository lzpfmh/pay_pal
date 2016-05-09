defmodule PayPal.Support.Event do

  @digest_types %{
    "md5" => :md5,
    "sha" => :sha,
    "sha224" => :sha224,
    "sha256" => :sha256,
    "sha384" => :sha384,
    "sha512" => :sha512
  }
  
  defp signature_msg(transmission_id, timestamp, webhook_id, event_body) do
    crc = Integer.to_string(:erlang.crc32(event_body))
    transmission_id <> "|" <> timestamp <> "|" <> webhook_id <> "|" <> crc
  end

  defp digest_type(algo) do
    key = String.downcase(algo)
    Map.get(@digest_types,key,nil)
  end

  def verify(transmission_id, timestamp, webhook_id, event_body, cert, signature_encoded, algo) do
    digest_type = digest_type(algo)
    if nil == digest_type do
      false
    else
      msg = signature_msg(transmission_id,timestamp,webhook_id,event_body)
      {{algorithm,_},public_key} = :ttalk_cert.public_key(cert)
      {:ok,signature} = Base.decode64(signature_encoded)
      :crypto.verify(algorithm,digest_type,msg,signature,public_key)
    end

  end




end