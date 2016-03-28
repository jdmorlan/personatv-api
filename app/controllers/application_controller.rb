class ApplicationController < ActionController::API
  before_action do
    raw_token = request.env.fetch('auth.token', {})
    @token = Token.new(raw_token)
  end

  def require_token!
    unless @token.present?
      message = { message: 'No auth token provided in HTTP_AUTHORIZATION header'}
      render json: message, status: 401
    end
  end
end
