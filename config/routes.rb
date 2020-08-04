Rails.application.routes.draw do

get "home/about" => "about#index"
devise_for :users
root to: "home#index"
get  "/users/:id/following_posts/" => "users#following_posts"
resources :users do
	resource :relationships, only: [:create, :destroy]

	member do
     get :following, to: 'users#following'
     get :followers, to: 'users#followers'
    end
end

resources :books do
	resource :favorite, only: [:destroy, :create]
	resources :book_comments, only: [:create, :destroy]
end



end
