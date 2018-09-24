Rails.application.routes.draw do
  get 'api', to: 'api#search', as:"search"
  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
