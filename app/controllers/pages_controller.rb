class PagesController < ApplicationController


  def login
    session[:email_address] =  params[:q] if params[:q]
  end
  
  def errors 
  end

  def div_by_0_error
    1 / 0 
  end

  def undefined_error
    a.size
  end

  def type_error
    [1, 2, 3].first("two")
  end

  def uncaught_error
    raise 
  end

  def wrong_num_args_error
    a = []
    a[]
  end
  
  def syntax_error
    a = []
    a.map {}
  end

  def index_error
    a = []
    a.fetch(1)
  end
 
  def load_error
    require 'this/file/does/not/exist'
  end

  def undefined_method_error
    this_limit_does_not_exist()
  end

  private

end
