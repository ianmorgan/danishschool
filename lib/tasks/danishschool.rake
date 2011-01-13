
ENV['RAILS_ENV'] ||= "development"

namespace :danishschool do
  desc "Administration of the Danish school"
  task :default_content => :environment do
    puts "Removing existing content" 
    Page.delete_all
    NewsItem.delete_all
    Event.delete_all
    Member.delete_all
    TaughtClass.delete_all
    Attachment.delete_all
    Lesson.delete_all
    
    puts "Creating default content"
    Page.new(:page => 'home',
             :description => 'The home page', 
             :content => File.new('defaultcontent/homepage.txt').read).save
    Attachment.new(:name => 'danish_school_kids',
                   :data => File.new('defaultcontent/kids.jpg','rb').read,
                   :purpose_code => 'attachment',
                   :mime_type => 'image/jpeg').save
    Page.new(:page => 'aim',       
             :description => 'The aims page', 
             :content => File.new('defaultcontent/aim.txt').read).save
    Page.new(:page => 'practical', 
             :description => 'The practical page', 
             :content => File.new('defaultcontent/practical.txt').read).save
    Page.new(:page => 'history', 
             :description => 'The history page', 
             :content => File.new('defaultcontent/history.txt').read).save
    Page.new(:page => 'contact_us',
             :description => 'The contact us page', 
             :content => File.new('defaultcontent/contactus.txt').read).save
    Page.new(:page => 'teachers_header',
             :description => 'header section for teachers page', 
    	     :content => 'h1. Our Teachers and Assistants').save
    Page.new(:page => 'teachers_footer',
    	     :description => 'footer section for teachers page', 
    	     :content => '').save
    Page.new(:page => 'committee_header',
             :description => 'header section for committee page', 
    	     :content => 'h1. The Committee').save
    Page.new(:page => 'committee_footer',
    	     :description => 'footer section for committee page', 
	     :content => '').save
    Page.new(:page => 'classes_header',
             :description => 'header section for classes page', 
    	     :content => 'h1. Our Classes').save
    Page.new(:page => 'classes_footer',
    	     :description => 'footer section for classes page', 
	     :content => '').save
	     
    NewsItem.new (:news_date => Time.new,
                  :news_text => "New Danish School Down Under web site now running").save
                  
    TaughtClass.new(:code => 'PREP',
                    :name => 'Di smaa',
                    :description => 'Little Danes!').save

    TaughtClass.new(:code => 'MIDDLE',
                    :name => 'Mellemste',
                    :description => 'Growing Danes!').save

    TaughtClass.new(:code => 'SENIOR',
                    :name => 'Aeldste',
                    :description => 'Great Danes!').save
                  
    
    school_day_msg = "Class starts at 10AM sharp. Please try to be here a few minutes beforehand"
    e = Event.new(:event_date => "02/07/2010".to_date,
              :start_time => "02/07/2010 10:00".to_time,
              :end_time => "02/07/2010 12:30".to_time,
              :event_type => "SchoolDay",
              :title => "Classes",
              :description => school_day_msg )
    e.save
    e.create_lessons
              
    e = Event.new(:event_date => "02/14/2010".to_date,
              :start_time => "02/14/2010 10:00".to_time,
              :end_time => "02/14/2010 12:30".to_time,
              :event_type => "SchoolDay",
              :title => "Classes",
              :description => school_day_msg )
    e.save
    e.create_lessons
        
    e = Event.new(:event_date => "02/21/2010".to_date,
              :start_time => "02/21/2010 10:00".to_time,
              :end_time => "02/21/2010 12:30".to_time,
              :event_type => "SchoolDay",
              :title => "Classes",
              :description => school_day_msg )
    e.save
    e.create_lessons
    
    e = Event.new(:event_date => "02/28/2010".to_date,
              :start_time => "02/28/2010 10:00".to_time,
              :end_time => "02/28/2010 12:30".to_time,
              :event_type => "SchoolDay",
              :title => "Classes",
              :description => school_day_msg )
    e.save
    e.create_lessons
    
    e = Event.new(:event_date => "03/14/2010".to_date,
              :start_time => "03/14/2010 10:00".to_time,
              :end_time => "03/14/2010 12:30".to_time,
              :event_type => "SchoolDay",
              :title => "Classes",
              :description => school_day_msg )
    e.save
    e.create_lessons
    
    # what goes here?
       
    e = Event.new(:event_date => "04/18/2010".to_date,
              :start_time => "04/18/2010 10:00".to_time,
              :end_time => "04/18/2010 12:30".to_time,
              :event_type => "SchoolDay",
              :title => "Classes",
              :description => school_day_msg )
    e.save
    e.create_lessons
    
        puts "state here"

          
    e = Event.new(:event_date => "05/02/2010".to_date,
              :start_time => "05/02/2010 10:00".to_time,
              :end_time => "05/02/2010 12:30".to_time,
              :event_type => "SchoolDay",
              :title => "Classes",
              :description => school_day_msg )
    e.save
    e.create_lessons
    
    e = Event.new(:event_date => "05/09/2010".to_date,
              :start_time => "05/09/2010 10:00".to_time,
              :end_time => "05/09/2010 12:30".to_time,
              :event_type => "SchoolDay",
              :title => "Classes",
              :description => school_day_msg )
    e.save
    e.create_lessons
       
  
    e = Event.new(:event_date => "05/16/2010".to_date,
                :start_time => "05/16/2010 10:00".to_time,
                :end_time => "05/16/2010 12:30".to_time,
                :event_type => "SchoolDay",
                :title => "Classes",
                :description => school_day_msg )
    e.save
    e.create_lessons
  
  
    e = Event.new(:event_date => "05/23/2010".to_date,
                :start_time => "05/23/2010 10:00".to_time,
                :end_time => "05/23/2010 12:30".to_time,
                :event_type => "SchoolDay",
                :title => "Classes",
                :description => school_day_msg )
    e.save
    e.create_lessons
  
    e = Event.new(:event_date => "05/30/2010".to_date,
              :start_time => "05/30/2010 10:00".to_time,
              :end_time => "05/30/2010 12:30".to_time,
              :event_type => "SchoolDay",
              :title => "Classes",
              :description => school_day_msg )
    e.save
    e.create_lessons
            
    e = Event.new(:event_date => "06/06/2010".to_date,
              :start_time => "06/06/2010 10:00".to_time,
              :end_time => "06/06/2010 12:30".to_time,
              :event_type => "SchoolDay",
              :title => "Classes",
              :description => school_day_msg )
    e.save
    e.create_lessons
   
    e = Event.new(:event_date => "06/20/2010".to_date,
              :start_time => "06/20/2010 10:00".to_time,
              :end_time => "06/20/2010 12:30".to_time,
              :event_type => "SchoolDay",
              :title => "Classes",
              :description => school_day_msg )
    e.save
    e.create_lessons
    
    e = Event.new(:event_date => "07/18/2010".to_date,
              :start_time => "07/18/2010 10:00".to_time,
              :end_time => "07/18/2010 12:30".to_time,
              :event_type => "SchoolDay",
              :title => "Classes",
              :description => school_day_msg )
    e.save
    e.create_lessons

    e = Event.new(:event_date => "07/25/2010".to_date,
              :start_time => "07/25/2010 10:00".to_time,
              :end_time => "07/25/2010 12:30".to_time,
              :event_type => "SchoolDay",
              :title => "Classes",
              :description => school_day_msg )
    e.save
    e.create_lessons
    
    e = Event.new(:event_date => "08/01/2010".to_date,
              :start_time => "08/01/2010 10:00".to_time,
              :end_time => "08/01/2010 12:30".to_time,
              :event_type => "SchoolDay",
              :title => "Classes",
              :description => school_day_msg )
    e.save
    e.create_lessons
      
    e = Event.new(:event_date => "08/08/2010".to_date,
              :start_time => "08/08/2010 10:00".to_time,
              :end_time => "08/08/2010 12:30".to_time,
              :event_type => "SchoolDay",
              :title => "Classes",
              :description => school_day_msg )
    e.save
    e.create_lessons
    
    e = Event.new(:event_date => "08/22/2010".to_date,
              :start_time => "08/22/2010 10:00".to_time,
              :end_time => "08/22/2010 12:30".to_time,
              :event_type => "SchoolDay",
              :title => "Classes",
              :description => school_day_msg )
    e.save
    e.create_lessons
    
    e = Event.new(:event_date => "08/29/2010".to_date,
              :start_time => "08/29/2010 10:00".to_time,
              :end_time => "08/29/2010 12:30".to_time,
              :event_type => "SchoolDay",
              :title => "Classes",
              :description => school_day_msg )
    e.save
    e.create_lessons
   
    e = Event.new(:event_date => "09/05/2010".to_date,
              :start_time => "09/05/2010 10:00".to_time,
              :end_time => "09/05/2010 12:30".to_time,
              :event_type => "SchoolDay",
              :title => "Classes",
              :description => school_day_msg )
    e.save
    e.create_lessons
    
    e = Event.new(:event_date => "09/12/2010".to_date,
              :start_time => "09/12/2010 10:00".to_time,
              :end_time => "09/12/2010 12:30".to_time,
              :event_type => "SchoolDay",
              :title => "Classes",
              :description => school_day_msg )
    e.save
    e.create_lessons
    
 
    e = Event.new(:event_date => "10/10/2010".to_date,
               :start_time => "10/10/2010 10:00".to_time,
               :end_time => "10/10/2010 12:30".to_time,
               :event_type => "SchoolDay",
               :title => "Classes",
               :description => school_day_msg )
    e.save
    e.create_lessons
    
    e = Event.new(:event_date => "10/17/2010".to_date,
              :start_time => "10/17/2010 10:00".to_time,
              :end_time => "10/17/2010 12:30".to_time,
              :event_type => "SchoolDay",
              :title => "Classes",
              :description => school_day_msg )
    e.save
    e.create_lessons
   
    e = Event.new(:event_date => "10/24/2010".to_date,
              :start_time => "10/24/2010 10:00".to_time,
              :end_time => "10/24/2010 12:30".to_time,
              :event_type => "SchoolDay",
              :title => "Classes",
              :description => school_day_msg )
    e.save
    e.create_lessons
   
    e = Event.new(:event_date => "11/07/2010".to_date,
               :start_time => "11/07/2010 10:00".to_time,
               :end_time => "11/07/2010 12:30".to_time,
               :event_type => "SchoolDay",
               :title => "Classes",
               :description => school_day_msg )
     e.save
     e.create_lessons

    e = Event.new(:event_date => "11/14/2010".to_date,
              :start_time => "11/14/2010 10:00".to_time,
              :end_time => "11/14/2010 12:30".to_time,
              :event_type => "SchoolDay",
              :title => "Classes",
              :description => school_day_msg )
    e.save
    e.create_lessons

    e = Event.new(:event_date => "11/21/2010".to_date,
              :start_time => "11/21/2010 10:00".to_time,
              :end_time => "11/21/2010 12:30".to_time,
              :event_type => "SchoolDay",
              :title => "Classes",
              :description => school_day_msg )
    e.save
    e.create_lessons

    e = Event.new(:event_date => "11/28/2010".to_date,
              :start_time => "11/28/2010 10:00".to_time,
              :end_time => "11/28/2010 12:30".to_time,
              :event_type => "SchoolDay",
              :title => "Classes",
              :description => school_day_msg )
    e.save
    e.create_lessons
    
    e = Event.new(:event_date => "12/12/2010".to_date,
              :start_time => "12/12/2010 10:00".to_time,
              :end_time => "12/12/2010 12:30".to_time,
              :event_type => "SchoolDay",
              :title => "Classes",
              :description => school_day_msg )
    e.save
    e.create_lessons
    
    e = Event.new(:event_date => "12/19/2010".to_date,
              :start_time => "12/18/2010 10:00".to_time,
              :end_time => "12/19/2010 12:30".to_time,
              :event_type => "SchoolDay",
              :title => "Classes",
              :description => school_day_msg )
    e.save
    e.create_lessons

   
    
  #  Event.new(:event_date => "11/29/2009".to_date,
  #            :start_time => "11/29/2009 12:30".to_time,
  #            :end_time => "11/29/2009 13:00".to_time,
  #            :event_type => "Other",
  #            :title => "Theme",
  #            :description => "Theme?").save

              
    pw = "princessmary"           
    
    Member.new(:name => 'Thomas Hansen',
               :summary => 'Teacher',
               :email => 'thomas@danishschool.com',
               :password => pw,
               :password_confirmation => pw,
               :is_admin => false,
               :is_teacher => true,
               :is_committee_member => false).save
               
    Member.new(:name => 'Maj Ingerman',
               :summary => 'Teacher',
               :email => 'maj@danishschool.com',
               :password => pw,
               :password_confirmation => pw,
               :is_admin => false,
               :is_teacher => true,
               :is_committee_member => false).save

    Member.new(:name => 'Anne Juul',
               :summary => 'Teacher and President',
               :email => 'anne@danishschool.com',
               :password => pw,
               :password_confirmation => pw,
               :is_admin => true,
               :is_teacher => true,
               :is_committee_member => true).save

    Member.new(:name => 'Henrik Winther',
               :summary => 'Teacher',
               :email => 'henrik@danishschool.com',
               :password => pw,
               :password_confirmation => pw,
               :is_admin => false,
               :is_teacher => true,
               :is_committee_member => false).save

    Member.new(:name => 'Keira',
               :summary => 'Teacher',
               :email => 'keira@danishschool.com',
               :password => pw,
               :password_confirmation => pw,
               :is_admin => false,
               :is_teacher => true,
               :is_committee_member => false).save

    Member.new(:name => 'Natalie Jensen',
               :summary => 'Teacher',
               :email => 'natalie@danishschool.com',
               :password => pw,
               :password_confirmation => pw,
               :is_admin => false,
               :is_teacher => true,
               :is_committee_member => false).save
               
    Member.new(:name => 'Nicholas Ranjel',
               :summary => 'Assistant',
               :email => 'nichloas@danishschool.com',
               :password => pw,
               :password_confirmation => pw,
               :is_admin => false,
               :is_teacher => true,
               :is_committee_member => false).save
               
    Member.new(:name => 'Caroline Casey',
               :summary => 'Assistant',
               :email => 'caroline@danishschool.com',
               :password => pw,
               :password_confirmation => pw,
               :is_admin => false,
               :is_teacher => true,
               :is_committee_member => false).save

    Member.new(:name => 'Marianne Fontaine',
               :summary => 'Committee Member',
               :email => 'marianne@danishschool.com',
               :password => pw,
               :password_confirmation => pw,
               :is_admin => false,
               :is_teacher => false,
               :is_committee_member => true).save

    Member.new(:name => 'Jytte Ranjel',
               :summary => 'Committee Member',
               :email => 'jyttem@danishschool.com',
               :password => pw,
               :password_confirmation => pw,
               :is_admin => false,
               :is_teacher => false,
               :is_committee_member => true).save

    Member.new(:name => 'Maria Gaff-Larsen',
               :summary => 'Committee Member',
               :email => 'maria@danishschool.com',
               :password => pw,
               :password_confirmation => pw,
               :is_admin => false,
               :is_teacher => false,
               :is_committee_member => true).save

    Member.new(:name => 'Erik Thorup',
               :summary => 'Committee Member',
               :email => 'erik@danishschool.com',
               :password => pw,
               :password_confirmation => pw,
               :is_admin => false,
               :is_teacher => false,
               :is_committee_member => true).save

    Member.new(:name => 'Ole Sorensen',
               :summary => 'Committee Member',
               :email => 'ole@danishschool.com',
               :password => pw,
               :password_confirmation => pw,
               :is_admin => false,
               :is_teacher => false,
               :is_committee_member => true).save

    Member.new(:name => 'Kisten Casey',
               :summary => 'Committee Member',
               :email => 'kisten@danishschool.com',
               :password => pw,
               :password_confirmation => pw,
               :is_admin => false,
               :is_teacher => false,
               :is_committee_member => true).save

    Member.new(:name => 'Rasmus Fiedler',
               :summary => 'Committee Member',
               :email => 'rasmus@danishschool.com',
               :password => pw,
               :password_confirmation => pw,
               :is_admin => false,
               :is_teacher => false,
               :is_committee_member => true).save

    Member.new(:name => 'Paula Madsen',
               :summary => 'Committee Member',
               :email => 'paula@danishschool.com',
               :password => pw,
               :password_confirmation => pw,
               :is_admin => false,
               :is_teacher => false,
               :is_committee_member => true).save


    Member.new(:name => 'Admin',
               :summary => 'Site Admin',
               :email => 'admin@danishschool.com',
               :password => 'password',
               :password_confirmation => 'password',
               :is_admin => true,
               :is_teacher => false,
               :is_committee_member => false).save
           
           
#    Attachment.new(:name => 'newsletter_jan_09',
#                   :data => File.new('defaultcontent/newsletter.pdf','rb').read,
#                   :purpose_code => 'newsletter',
#                   :mime_type => 'application/pdf').save

    Attachment.new(:name => 'newsletter_jan_2010',
                   :data => File.new('defaultcontent/newsletter_jan_2010.pdf','rb').read,
                   :purpose_code => 'newsletter',
                   :mime_type => 'application/pdf').save

    Attachment.new(:name => 'presidents_letter_sept_09',
                   :data => File.new('defaultcontent/PresidentLetterSeptember2009.pdf','rb').read,
                   :purpose_code => 'attachment',
                   :mime_type => 'application/pdf').save
                   
    Attachment.new(:name => 'curriculum_2010',
                   :data => File.new('defaultcontent/curriculum2010.pdf','rb').read,
                   :purpose_code => 'attachment',
                   :mime_type => 'application/pdf').save
                   
    Attachment.new(:name => 'enrolment_form',
                   :data => File.new('defaultcontent/enrolment_form.pdf','rb').read,
                   :purpose_code => 'attachment',
                   :mime_type => 'application/pdf').save
                     
    

               
    
  end
end
