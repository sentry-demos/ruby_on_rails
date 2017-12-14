Rails.application.routes.draw do

  root 'pages#login'
  get  'pages/login'

  get  'pages/errors'

  get  'pages/div_by_0_error'

  get  'pages/nil_error'

  get  'pages/wrong_num_args_error'

  get  'pages/syntax_error'
 
  get  'pages/load_error'

  get  'pages/index_error'

  get  'pages/undefined_error'

  get  'pages/undefined_method_error'
end
