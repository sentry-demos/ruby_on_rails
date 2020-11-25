class ApplicationController < ActionController::Base
  before_action :set_sentry_context

  private
  
  # Check for POST request body, Set User and Tags
  def set_sentry_context
    if (request.body.read.length >= 2)
      data = JSON.parse request.body.read
      email = data["email"]
    else
      email = (0...4).map { (65 + rand(26)).chr }.join.downcase + "@yahoo.com"
    end
    xactionId = request.headers["X-Transaction-ID"]
    sessionId = request.headers["X-Session-ID"]

    Sentry.configure_scope do |scope|
      scope.set_user(email: email)
      scope.set_tags("transaction-id": xactionId, "session-id": sessionId)
    end
  end
end