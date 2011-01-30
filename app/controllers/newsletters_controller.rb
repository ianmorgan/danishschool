class NewslettersController < ApplicationController
  layout 'internal'
  
  def index
     @newsletters = Attachment.valid.newsletters.ordered
     render :template => 'newsletters/index'
  end

 def new 
    @attachment = Attachment.new('purpose_code' => 'newsletter','name' => 'newsletter')
    @attachment.save
    render :template => 'attachment/selectfile'  
  end

  def upload
   @attachment = Attachment.find(params[:id])
   
   if params[:picture] 
     f = params[:picture]
     @attachment.data = f.read
     @attachment.mime_type = f.content_type
     @attachment.save
     flash[:notice] = 'Newsletter uploaded'
     redirect_to :action => 'index'
   else
     @attachment.errors.add(:base, "Please select a file to upload")
     render :template => 'attachment/selectfile'
   end
  end
  

end
