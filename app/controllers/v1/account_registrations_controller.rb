class V1::AccountRegistrationsController < ApplicationController
  def create
    registration = AccountRegistration.new(user: User.new, account: Account.new)
    if registration.validate(allowed_params)
      registration.save
      token = TokenGenerator.generate(registration.user)
      render json: { token: token }, status: 200
    else
      render json: registration.errors.messages, status: 422
    end
  end

  private

  def allowed_params
    params
      .require(:data)
      .permit(:email, :first_name, :last_name,
              :password, :password_confirmation)
  end
end
