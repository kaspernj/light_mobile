Rails.application.routes.draw do
  mount LightMobile::Engine => "/light_mobile"

  resources :contents do
    collection do
      get :horizontal_scrolling
      get :simple_form
    end
  end

  resources :tables

  root to: "dashboard#show"
end
