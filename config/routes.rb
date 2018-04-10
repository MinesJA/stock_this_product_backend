Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html




  namespace :api do
    namespace :v1 do
        resources :csvs, only: [:create]
        post '/stores/fetchnear', :to => 'stores#fetchnear'
        post '/signup', to: "users#create"
    end
  end
end
