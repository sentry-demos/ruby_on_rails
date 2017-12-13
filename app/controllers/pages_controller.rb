class PagesController < ApplicationController


  
  def login
    Raven.user_context(
      # the actor's email address, if available
      email: "vu+rails@sentry.io", # "example@example.org"
    )
  end

  
  def div_by_0_error
    begin
      1 / 0
    rescue => exception
      Raven.capture_exception(exception)
    end  
  end


  def undefined_error
    begin
      a.type
    rescue => exception
      Raven.capture_exception(exception)
    end
  end


  def type_error
    Raven.capture do
     [1, 2, 3].first("two")
    end
  end
  





end
