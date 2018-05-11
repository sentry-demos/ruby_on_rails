# README

This app demonstrates how to include and configure Sentry-Raven into a Ruby on Rails application.


## Prerequites  

* Install Ruby version 2.3.3p222

* Install Rails version 5.1.4


## Setup Instructions
1. Add Sentry-Raven gem to Gemfile

``` ruby
gem "sentry-raven"
```

2. Set the DSN in application.rb

``` ruby
Raven.configure do |config|
  config.dsn = 'https://*******@sentry.io/22323232343'
end
```

3. Modify application_controller.rb

``` ruby
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

## Notes on routing errors
By default `raven-ruby` ignores `ActionController::RoutingError`. For the purpose of demonstrating the `Undefined Route Error`, ```config.excluded_exceptions = []``` was added to the Raven config in `application.rb`. This configuration changes the default behavior to allow routing errors to appear in Sentry.

## Deploy to Heroku
Note: Download and install Heroku Toolbelt
1. Create a heroku project in your local repo
```
heroku create
```

2. Deploy remote repo onto heroku server
```
git push herkou master
```
