class Member < ActiveRecord::Base
  has_one :attachment

  validates_presence_of :name, :summary
  validates_presence_of :password_confirmation, :if => :password_changed? 
  validate :valid_email?
  validates_confirmation_of :password, :if => :password_changed?
  
  named_scope :teachers, :conditions => {:is_teacher => true }
  named_scope :committee_members, :conditions => {:is_committee_member => true }

  named_scope :ordered, :order => "name asc"
  
  def self.authenticate(email, password)
     find(:first, :conditions => { :email => email, :password => password }) 
  end

  def valid_email
    #todo - is rails 3 still using TMail
    #TMail::Address.parse(email) if email.length > 0
  rescue
    errors.add_to_base("Must be a valid email")
  end
end
