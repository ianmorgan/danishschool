class AdminPageController < ApplicationController
  layout "internal"
  before_filter :require_login
 
  private
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to(:controller => 'login', :action => 'show')  # halts request cycle
    end
  end

 
  def logged_in?
    !session[:login].nil?
  end

end
