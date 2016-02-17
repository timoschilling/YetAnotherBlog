Rails.application.routes.draw do
  resources :posts, only: [:index, :show] do
    collection do
      get :api
    end
  end
end
