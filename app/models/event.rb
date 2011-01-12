class Event < ActiveRecord::Base
  has_many :lessons
  validates_presence_of :event_date, :start_time, :end_time, :title, :description, :event_type
  validates_length_of :title, :in => 2..20 
  validate :end_time_after_start
  validate :valid_event_type
  
  named_scope :ordered, :order => "event_date desc"
  named_scope :school_days, :conditions => "event_type = 'SchoolDay'"


  EVENT_TYPES = ["SchoolDay", "Event", "Other"] 

  def create_lessons
     TaughtClass.all.each do |t| 
       Lesson.new(:content => 'Teacher to provided some notes about this lesson',
                  :taught_class_id => t.id,
                  :event_id => id).save
     end  
  end
  
  def schoolday?
    event_type == "SchoolDay" 
  end
  
   
private
  def end_time_after_start
      if end_time < start_time
         errors.add(:end_time, 'The end time must be after the start')
      end
  end
  
  def valid_event_type 
     if !EVENT_TYPES.include?(event_type)
       errors.add :event_type, "valid value are #{EVENT_TYPES.join(' ')}"
     end
  end
end


class EventLister
  def initialize(events)
    @events = events
  end
  
  def each_by_day
    lastday = @events.first.event_date.yday 
    even = true
    @events.each do |e|
      if e.event_date.yday != lastday 
        even = ! even
      end
      yield e, even 
      lastday = e.event_date.yday
    end
  end

end