Rails.application.routes.draw do
  scope '(:locale)', constraints: { locale: /\w{2}/ } do
    root 'home#index'
    get '/info', to: 'home#info'

    resources :uses
    resources :accounts
    resources :histories
    resources :events

    resources :uses, only: :index do
      collection { post :import }
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
