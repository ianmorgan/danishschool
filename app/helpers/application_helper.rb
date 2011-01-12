require 'redcloth'


# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  # parse and return data as HTML
  def to_html(rawtext)
    return "" if rawtext.nil?
    
    r = RedCloth.new rawtext
    r.to_html.html_safe    
  end
  
  def is_logged_in
     !session[:login].nil? 
  end
  
  def show_logon_status
     if is_logged_in 
       login_link = link_to('logout', :action => :logout, :controller => :login)
       "Logged in as #{session[:login][:name]} #{login_link}" 
     else
      "Not logged in"
     end
  end

 def is_internal_user
     !session[:login].nil?
 end
  
 def is_admin_user
     is_internal_user && session[:login][:is_admin]
 end

 def is_teacher_user
     is_internal_user && session[:login][:is_teacher]
 end
 

 
 def current_user_id
    if is_logged_in 
      session[:login][:id]
    end
 end
 
 

  
 
end
