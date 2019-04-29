class ApplicationController < ActionController::Base
  before_action :set_raven_context

  private
  
  # Check for POST request body, Set User and Tags
  def set_raven_context
    if (request.body.read.length >= 2)
      data = JSON.parse request.body.read
      email = data["email"]
    else
      email = (0...4).map { (65 + rand(26)).chr }.join.downcase + "@yahoo.com"
    end
    Raven.user_context( email: email)
    Raven.tags_context "transaction-id": request.headers["X-Transaction-ID"]
    Raven.tags_context "session-id": request.headers["X-Session-ID"]
  end
end