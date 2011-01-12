class LoginController < ApplicationController
   layout "internal"
   
   def show
      render :template => 'login/show'
   end
   
   def login
     @member = Member.authenticate(params[:email], params[:password]) 
     
     if @member 
       session[:login] = {:name => @member.name,
                          :is_admin => @member.is_admin,
                          :is_teacher => @member.is_teacher,
                          :id => @member.id }
       redirect_to :action => 'currentuser'
     else
       flash[:notice] = 'Incorrect email address or password.'
       redirect_to :action => 'show'
     end
   end
   
   def edit_password
     @member = Member.find(params[:id])
     render :template => 'login/edit_password'
   end
   
   def update_password
     @member = Member.find(params[:id])
     
     if @member.password == params[:member][:password]
       flash[:notice] = 'Password unchanged'
       redirect_to(@member)
     else 
       @member.password = params[:member][:password]
       @member.password_confirmation = params[:member][:password_confirmation]
     
       if @member.save
         flash[:notice] = 'Member''s password was successfully changed.'
         redirect_to(@member)
       else
         render :action => 'edit_password'
       end
     end
   end
   
   def currentuser
     @member = Member.find(session[:login][:id])
     render :template=> 'login/currentuser'
   rescue
     redirect_to :action => 'show'
   end
   
   def logout 
      session[:login] = nil
      render :template => 'login/logout'
   end   
end
