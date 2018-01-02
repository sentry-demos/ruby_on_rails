class PagesController < ApplicationController


  def login
    @@email_address = get_email_address  
    #Raven.user_context( email: @@email_address) if @@email_address
    #binding.pry
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
    #binding.pry    
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

  def get_email_address
    email_address =  params["post"]["email_address"] if params["post"]
  end  

end
