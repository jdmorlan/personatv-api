class V1::AccountTokensController < ApplicationController
  def create
    user = User.find_by(email: allowed_params[:email])
    if user && user.authenticate(allowed_params[:password])
      token = TokenGenerator.generate(user)
      render json: {token: token }, status: 200
    else
      message = { error: 'Invalid credentials' }
      render json: message, status: 401
    end
  end

  private

  def allowed_params
    params.require(:data).permit(:email, :password)
  end
end
