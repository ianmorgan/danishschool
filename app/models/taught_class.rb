class TaughtClass < ActiveRecord::Base
  has_many :lessons
  validates_presence_of :code, :name
  
  
end
