class NewslettersController < ApplicationController
  layout 'internal'
  
  def index
     @newsletters = Attachment.ordered.find_all_by_purpose_code 'newsletter'
     render :template => 'newsletters/index'
  end
end
