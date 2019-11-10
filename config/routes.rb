# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  concern :file_bunch do
    collection do
      post :import
      get :export
    end
  end

  scope '(:locale)', constraints: { locale: /\w{2}/ } do
    root 'home#index'
    get '/info', to: 'home#info'

    resources :summary, only: :index do
      collection do
        get 'chartdata'
      end
    end

    scope :data_management do
      resources :uses, concerns: :file_bunch
      resources :accounts, concerns: :file_bunch
      resources :histories, concerns: :file_bunch
      resources :events
    end
  end
end
