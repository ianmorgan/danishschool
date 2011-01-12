class Lesson < ActiveRecord::Base
  belongs_to :taught_class
  belongs_to :event
  
  # todo - should be joining to event.event_date
  named_scope :ordered, :order => "events.event_date desc", :include => :event
  

end
