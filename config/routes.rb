Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 get "/about" => "home#about", as: :about

 resources :projects do
   resources :discussions
end
resources :discussions, only: [] do
  resources :comments
end

root 'home#index'
end
