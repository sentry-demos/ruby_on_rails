# README

This app demonstrates how to include and configure Sentry-Raven into a Ruby on Rails application. 


## Prerequites  

* Install Ruby version 2.3.3p222

* Install Rails version 5.1.4

* Configuration

* Deployment instructions



## Setup Instructions
1. Add Sentry-Raven gem to Gemfile

```
gem "sentry-raven"
```

2. Set the DSN in application.rb 

```
Raven.configure do |config|
  config.dsn = 'https://*******@sentry.io/22323232343'
end
```

3. Modify application_controller.rb 
```
class ApplicationController < ActionController::Base
  before_action :set_raven_context
  
  private 
  
  def set_raven_context
    Raven.user_context(id: session[:current_user_id]) # or anything else in session
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
```

More installation details here: https://docs.sentry.io/clients/ruby/


## Sentry-cli
To easily leverage Sentry's Releases and Commits features, install sentry-cli. Installation instructions here: https://docs.sentry.io/learn/cli/installation/


