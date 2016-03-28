class JwtDecoder
  def initialize(application, encode_token, decode_token)
    @application = application
    @encode_token = encode_token
    @decode_token = decode_token
  end

  def call(environment)
    @environment = environment
    set_decoded_token
    @application.call(@environment)
  end

  private

  def get_encoded_token
    @environment[@encode_token]
  end

  def set_decoded_token
    token = get_encoded_token

    if token
      @environment[@decode_token] = decode_token(get_encoded_token)
    end
  end

  def get_hmac_secret
    Rails.application.secrets.secret_key_base
  end

  def decode_token(encoded_token)
    JWT.decode(encoded_token, get_hmac_secret, true, { algorithm: 'HS256' })
  end
end
