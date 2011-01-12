class Attachment < ActiveRecord::Base
   validates_inclusion_of :purpose_code, 
      :in => %w(member_picture attachment newsletter),  
      :message => "{{value}} is not a valid purpose" 
   
   named_scope :ordered, :order => 'created_at desc'
   named_scope :newletters, :conditions => "purpose_code = 'newsletter'"

   def extn_from_mime_type
     {'application/pdf' => 'pdf'}[mime_type]
   end
   
   def self.latest_newsletter
     ordered.newletters.first
   end
end
