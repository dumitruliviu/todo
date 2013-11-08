Todos::Application.routes.draw do
  resources :todos do
    get :checked, on: :member
  end
  
  root 'todos#index'
end
