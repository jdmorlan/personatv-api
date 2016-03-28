class Token
  def initialize(decoded_token)
    @token = ActiveSupport::HashWithIndifferentAccess.new(decoded_token)
  end

  def header
    @header ||= @token[:header]
  end

  def payload
    @payload ||= @token[:payload]
  end

  def user
    user = payload[:user]
    @user ||= User.find_by(id: user[:id])
  end
end
