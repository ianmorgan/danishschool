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

  private  
  def ie6?  
     request.user_agent =~ /MSIE 6.0/  
  end  
  helper_method :ie6?  
  
  # see http://www.perfectline.ee/blog/custom-dynamic-error-pages-in-ruby-on-rails
 # unless ActionController::Base.consider_all_requests_local
 #   rescue_from Exception, :with => :render_error
 #   rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
 #   rescue_from ActionController::RoutingError, :with => :render_not_found
 #   rescue_from ActionController::UnknownController, :with => :render_not_found
 #   rescue_from ActionController::UnknownAction, :with => :render_not_found
 # end

 # private

 # def render_not_found(exception)
 #   log_error(exception)
 #   render :template => "/error/404.html.erb", :status => 404
 # end

 # def render_error(exception)
 #   log_error(exception)
 #   render :template => "/error/500.html.erb", :status => 500
 # end 
 
end
