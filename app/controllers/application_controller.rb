class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :set_raven_context

  private
  
  def set_raven_context
    
    # Check for POST request body
    if (request.body.read.length >= 2)
      data = JSON.parse request.body.read
      Raven.user_context( email: data["email"])
    end

    Raven.tags_context "transaction-id": request.headers["X-Transaction-ID"]
    Raven.tags_context "session-id": request.headers["X-Session-ID"]

  end
end

# ?
# Raven.user_context( email: session[:email_address]) if session[:email_address]

# ?
# Raven.extra_context(params: params.to_unsafe_h, url: request.url)Q