class ContentController < ApplicationController
   layout "public"
   
   def home
      get_recent_events
      standard_content_page 'home'
   end
   
   def aim
      get_recent_events
      standard_content_page 'aim'
   end
   
   def contact_us
      get_recent_events
      standard_content_page 'contact_us'
   end
   
   def history
      get_recent_events
      standard_content_page 'history'
   end
   
   def practical
      get_recent_events
      standard_content_page 'practical'
   end

   def history
      get_recent_events
      standard_content_page 'history'
   end
  
   def sponsors
      get_recent_events
      standard_content_page 'sponsors'
   end

   def links
      get_recent_events
      standard_content_page 'links'
   end


 #  def newsletters 
 #    get_recent_events
 #    @header = Page.find_by_page('newsletters_header')
 #    @newsletters = Attachment.valid.newsletters.ordered
 #    @footer = Page.find_by_page('newsletters_footer')
 #    render :template => 'content/newsletters'
 #  end
  
   
   def teachers 
     get_recent_events
     @header = Page.find_by_page('teachers_header')
     @teachers = Member.teachers.ordered
     @footer = Page.find_by_page('teachers_footer')
     render :template => 'content/teachers'
   end
   
   def committee
     get_recent_events
     @header = Page.find_by_page('committee_header')
     @committee = Member.committee_members.ordered
     @footer = Page.find_by_page('committee_footer')
     render :template => 'content/committee'
   end
   
   def event
     get_recent_events
     @event = Event.find(params[:id])
     render :template => 'content/event'
   end
   
   def classes
     get_recent_events
     @header = Page.find_by_page('classes_header')
     @classes = TaughtClass.all
     @footer = Page.find_by_page('classes_footer')
     render :template => 'content/classes'
   end

   def news
     get_recent_events
     @header = Page.find_by_page('classes_header')
     @news = NewsItem.ordered.all
     @newsletters = Attachment.valid.newsletters.ordered
     @footer = Page.find_by_page('classes_footer')
     render :template => 'content/news'
   end

   def lesson
     get_recent_events
     @lesson = Lesson.find(params[:id])
     render :template => 'content/lesson'
   end
      
   def alllessons
     get_recent_events
     @schooldays = Event.school_days.ordered.all.reverse
     render :template => 'content/alllessons'
   end
   
private
   def standard_content_page(page)
      @page = Page.find_by_page(page)
      render :template => 'content/content_page'
   end
   
   def get_recent_events
      @events = Event.find(:all, :order => 'event_date asc')
      @eventlister = EventLister.new(@events)
   end
   
end
