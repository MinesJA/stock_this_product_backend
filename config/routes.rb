Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html




  namespace :api do
    namespace :v1 do
        post '/csvs', to: 'csvs#create'
        get '/stores/:id', to: "stores#index"
        post '/signup', to: "users#create"
        post '/login', to: "auth#create"
        post '/searches', to: "searches#create"
        post '/messages', to: "messages#create"

        get '/get_user', to: "auth#show"
        get '/producers', to: "producers#index"
        # get '/producers/:id/'
        get '/messages', to: "messages#index"
        get '/searches', to: "searches#index"

    end
  end
end
