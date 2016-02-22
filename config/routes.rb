Rails.application.routes.draw do
  namespace :admin do
    resource :user_sessions, only: [:new, :create, :destroy]
    root to: "dashboards#show"
  end

  root to: "home#index"
end
