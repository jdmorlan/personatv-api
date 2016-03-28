Rails.application.routes.draw do
  scope 'api', module: 'v1' do
    # Registration Routes
    post 'registrations/account'   =>    'account_registrations#create'
  end
end
