Rails.application.routes.draw do
  root "games#index"

  namespace "api" do
    resources "games", only: %i[index create update destroy] do
      collection do
        get :populate
        post :search
      end
    end
  end
end
