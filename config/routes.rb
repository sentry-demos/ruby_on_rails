Rails.application.routes.draw do

  root 'pages#login'
  get  'pages/login'

  get  'pages/errors'

  get  'pages/div_by_0_error'

  get  'pages/nil_error'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
