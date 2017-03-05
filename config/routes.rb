Rails.application.routes.draw do
  scope "/:locale" do
    resources :uses
    resources :accounts
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
