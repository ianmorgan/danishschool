class NewslettersController < ApplicationController
  layout 'internal'
  
  def index
     @newsletters = Attachment.ordered.find_all_by_purpose_code 'newsletter'
     render :template => 'newsletters/index'
  end

 def new 
    @attachment = Attachment.new('purpose_code' => 'newsletter','name' => 'newsletter')
    @attachment.save
    render :template => 'attachment/selectfile'  
  end

  def upload
   attachment = Attachment.find(params[:id])
   
   f = params[:picture]
   attachment.data = f.read
   attachment.mime_type = f.content_type
   attachment.save
   
   flash[:notice] = 'Newsletter uploaded'
   
   redirect_to :action => 'index'
  end
  

end
