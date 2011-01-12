module ContentHelper

   def show_event_times(event)
     #if event.end_time.nil?
       event.start_time.to_formatted_s(:time)
     ##else
     ##  "#{event.start_time.to_formatted_s(:time)} - #{event.end_time.to_formatted_s(:time)}"
     #end
   end

   
 
end
