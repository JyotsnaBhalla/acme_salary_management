Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "dashboard", to: "dashboard#show"
      get "employees/export", to: "employees#export"
      resources :employees, only: %i[index show update] do
        resources :salaries, only: %i[index create]
      end
    end
  end
end
