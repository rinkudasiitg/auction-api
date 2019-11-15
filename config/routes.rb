Rails.application.routes.draw do

  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :auctions do
      resources :items do
        resources :bids
      end
    end
  end


  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'

  mount ActionCable.server => '/cable'
end
