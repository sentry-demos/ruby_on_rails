# sentry-demos/ruby_on_rails
To show how Sentry works in an example Rails app
This app demonstrates how to include and configure Sentry-Raven into a Ruby on Rails application.

## Summary
To show how Sentry works in an example web app that uses Rails
- how to integrate the Sentry SDK into Rails https://docs.sentry.io/clients/ruby/
- trigger an error that gets sent as Event to Sentry.io Platform
- `checkout_controller.rb` has multiple endpoints for showing different ways that errors are handled
- Sentry Release cycle covered in `Makefile`

## Initial Setup & Run
1. Install Ruby version 2.3.3p222 and Rails version 5.1.7

2. install gems

```
bundle install
```

3. Set the DSN in application.rb

``` ruby
Raven.configure do |config|
  config.dsn = 'https://*******@sentry.io/22323232343'
end
```

4. Configure sentry-cli (is for creating Sentry releases) with your `SENTRY_AUTH_TOKEN` in Makefile or run `export SENTRY_AUTH_TOKEN=<your_auth_token>`. Do the same for `SENTRY_ORG` and `SENTRY_PROJECT`
5. Check your Github repo is integrated into your Sentry organization.
6. run `make`, which (Makefile) creates a Sentry release and runs Rails
7. `make deploy` and go to `localhost:3000/handled`
## GIF
...


## Notes on routing errors
By default `raven-ruby` ignores `ActionController::RoutingError`. For the purpose of demonstrating the `Undefined Route Error`, ```config.excluded_exceptions = []``` was added to the Raven config in `application.rb`. This configuration changes the default behavior to allow routing errors to appear in Sentry.

More installation details here: https://docs.sentry.io/clients/ruby/
