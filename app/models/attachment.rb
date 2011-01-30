class Attachment < ActiveRecord::Base
   validates_presence_of :name
   validates_inclusion_of :purpose_code, 
      :in => %w(member_picture attachment newsletter),  
      :message => "{{value}} is not a valid purpose" 
   
   named_scope :ordered, :order => 'created_at desc'
   named_scope :newsletters, :conditions => "purpose_code = 'newsletter'"
   named_scope :valid, :conditions => "data is not null"


   def extn_from_mime_type
     {'application/pdf' => 'pdf',
      'image/jpeg' => 'jpg' }[mime_type]
   end
   
   def self.latest_newsletter
     valid.ordered.newsletters.first
   end
end
