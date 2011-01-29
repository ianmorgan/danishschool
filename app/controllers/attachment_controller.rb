class AttachmentController < ApplicationController
  layout "internal"

  caches_action :view

  def uploadmemberpicture
   member = Member.find(params[:id])   
   member.attachment ||= Attachment.new  
   
   attachment = member.attachment
   
   f = params[:picture]
   attachment.data = f.read
   attachment.mime_type = f.content_type
   attachment.purpose_code = 'member_picture'
   attachment.name = member.name
   attachment.save
   
   flash[:notice] = 'Picture updated'
   
   redirect_to edit_member_path(:id => params[:id])

  end
  
  def test
   render :text => 'test'
  end
  
  def index 
    @attachments = Attachment.all :conditions => {:purpose_code => 'attachment'}
    render :template => 'attachment/index'
  end
  
  
  def new 
    @attachment = Attachment.new
    render :template => 'attachment/new'
  end
  
  def create 
    @attachment = Attachment.new(params[:attachment])
    @attachment.purpose_code = 'attachment'
    if @attachment.save
      render :action => 'selectfile', :id => @attachment.id  
    end
  end
  
  def selectfile
    @attachment = Attachment.find(params[:id])
    render :template => 'attachment/selectfile'
  end

  def view
   a = Attachment.find(params[:id])
   send_data a.data.to_blob, :type => a.mime_type , :disposition => 'inline'
   
   rescue
     render :nothing => true, :status => 404 
  end
  
  def view_by_name
     a = Attachment.find_by_name(params[:name])
     send_data a.data.to_blob, :type => a.mime_type , :disposition => 'inline'
     
     rescue
       render :nothing => true, :status => 404 
  end
  
  def download_by_name
     a = Attachment.find_by_name(params[:name])   
 
     send_data a.data.to_blob, 
     	:type => a.mime_type , 
     	:disposition => 'attachment', 
     	:filename => params[:name] + '.' + a.extn_from_mime_type
       
     rescue
       render :nothing => true, :status => 404 
  end

 
  
  def download
    a = Attachment.find(params[:id])
    send_data a.data.to_blob, 
	:type => a.mime_type , 
	:disposition => 'attachment',
 	:filename => a.name + '.' + a.extn_from_mime_type
    
    rescue
       render :nothing => true, :status => 404 
  end


  def upload
   
   attachment = Attachment.find(params[:id])
   
   f = params[:picture]
   attachment.data = f.read
   attachment.mime_type = f.content_type
   attachment.purpose_code = 'attachment'
   attachment.save
   
   flash[:notice] = 'Picture updated'
   
   redirect_to :action => 'summary', :id => attachment.id

  end
  
  def summary 
   @attachment = Attachment.find(params[:id])
   render :template => 'attachment/summary'
  end

  def delete
   @attachment = Attachment.find(params[:id])
   render :template => 'attachment/confirm_delete'
  end 

  def confirm_delete
    if params['yes']
      a = Attachment.find(params[:id])
      a.destroy
      flash[:notice] = 'Attachment deleted'
    end
    redirect_to :action => 'index'
  end  
end
