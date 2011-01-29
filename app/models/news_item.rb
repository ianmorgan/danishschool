require 'base'
class NewsItem < ActiveRecord::Base 
  include DanishSchoolHelpers

  validates_presence_of :news_date, :news_text
  
  named_scope :ordered, :order => "news_date desc"
 
  def trimmed_news_text
     trim_with_elipse(news_text)
  end
end
