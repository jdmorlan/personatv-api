class JwtDecoder
  def initialize(application, encode_location, decode_location)
    @application = application
    @encode_location = encode_location
    @decode_location = decode_location
  end

  def call(environment)
    @environment = environment
    set_decoded_token
    @application.call(@environment)
  end

  private

  def get_encoded_token
    @environment[@encode_location]
  end

  def set_decoded_token
    @environment[@decode_location] = decode_token(get_encoded_token)
  end

  def get_hmac_secret
    Rails.application.secrets.secret_key_base
  end

  def decode_token(encoded_token)
    JWT.decode(encoded_token, get_hmac_secret, true, { algorithm: 'HS256' })
  end
end
