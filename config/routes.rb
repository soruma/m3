Rails.application.routes.draw do
  resources :events
  scope "/:locale" do
    resources :uses
    resources :accounts
    resources :histories
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
