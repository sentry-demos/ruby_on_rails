# Must have `sentry-cli` installed globally
# Following env variables have to be set or passed in:
#  SENTRY_AUTH_TOKEN=<value> or have it set as environment variable

SENTRY_ORG=testorg-az
SENTRY_PROJECT=rails-demo
VERSION=`sentry-cli releases propose-version`

deploy: create_release associate_commits run_rails


create_release:
	sentry-cli releases -o $(SENTRY_ORG) new -p $(SENTRY_PROJECT) $(VERSION)
	
# makes Sentry look at commits sitting on Sentry, and associates them to this Release that's getting pushed up
associate_commits:
	sentry-cli releases -o $(SENTRY_ORG) -p $(SENTRY_PROJECT) set-commits --auto $(VERSION)


run_rails:
	VERSION=$(VERSION) bin/rails server -p 3001

