Rails.application.routes.draw do
  get 'likes/create'

  get 'likes/destroy'

  root 'sessions#login'

  get 'bright_ideas' => 'posts#index'

  get 'posts/show'

  get 'posts/destroy'

  get 'users/index'

  get 'login' => 'sessions#login'

  get 'logout' => 'sessions#logout'

  get 'users/:id' => 'users#show'

  get 'bright_ideas/:id' => 'posts#show'

  post 'posts' => 'posts#create'

  post 'users' => 'users#create'

  post 'login' => 'sessions#create'

  post 'likes' => 'likes#create'

  delete 'delete' => 'posts#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
