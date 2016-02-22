Rails.application.routes.draw do
  namespace :admin do
    root to: "dashboards#show"

    resource :user_sessions, only: [:new, :create, :destroy]
    resources :events, except: :new
  end

  root to: "home#index"
end
