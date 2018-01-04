class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_raven_context

  @@email_address = nil
  
  private
  
  def set_raven_context
    Raven.user_context( email: @@email_address) if @@email_address
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
