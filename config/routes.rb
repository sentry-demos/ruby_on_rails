Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'checkout', to: 'checkout#cart'

  get  'checkout/handled'

  get  'checkout/unhandled'
end
