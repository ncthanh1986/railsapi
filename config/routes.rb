Rails.application.routes.draw do
  resources :users
  post 'api/signup'
  post 'api/signin'
  post 'api/upload_photo'

  match "*path", to: "application#page_not_found", via: :all
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
