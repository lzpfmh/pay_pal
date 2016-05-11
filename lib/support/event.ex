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


  def verify(transmission_id, timestamp, webhook_id, event_body, cert, signature_encoded) do

    msg = signature_msg(transmission_id,timestamp,webhook_id,event_body)
    {{algorithm,digest_type},public_key} = :ttalk_cert.public_key(cert)
    {:ok,signature} = Base.decode64(signature_encoded)
    :crypto.verify(algorithm,digest_type,msg,signature,public_key)

  end


  def certification(url) do
    HTTPoison.get(url)
    |> handle_certification
  end
  
  defp handle_certification(response) do
    case response do
      {:ok, %HTTPoison.Response{status_code: code, body: body}} ->
        cond do
          code in 200..299 ->
            {:ok,body}
          true ->
            {:error, nil}
        end
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end
end