require 'base'
class NewsItem < ActiveRecord::Base 
  include DanishSchoolHelpers
  
  named_scope :ordered, :order => "news_date desc"
 
  def trimmed_news_text
     trim_with_elipse(news_text)
  end
end
