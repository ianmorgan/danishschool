# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
 

  # todo - also defined in appliaction helper
  # move to a module so they can be mixed in?
  def is_internal_user
      !session[:login].nil?
  end
   
  def is_admin_user  
    is_internal_user && session[:login][:is_admin]
  end

  def is_teacher_user
    is_internal_user && session[:login][:is_teacher]
  end

 
 def select_layout 
     is_internal_user ? "internal" : "public"
 end
  
 
end
