Rails.application.routes.draw do
  namespace :admin do
    root to: "dashboards#show"
  end

  root to: "home#index"
end
