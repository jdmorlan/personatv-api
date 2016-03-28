Rails.application.routes.draw do
  scope 'api', module: 'v1' do
    # Registration Routes
    post 'registrations/account'   =>    'account_registrations#create'

    # Token Routes
    post 'auth/getToken/account'   =>    'account_tokens#create'

    # Channel Owner Routes
    scope 'admin', module: 'channels' do
      get    'channels'           =>    'owner#index'
      get    'channels/:id'       =>    'owners#show'

      post   'channels'           =>    'owners#create'
      put    'channels/:id'       =>    'owners#update'
      patch  'channels/:id'       =>    'owners#update'
      delete 'channels/:id'       =>    'owners#destroy'
    end

    # Channel Viewer Routes
    scope module: 'channels' do
      get 'channels'              =>    'viewers#index'
      get 'channels/:id'          =>    'viewers#show'
    end
  end
end
