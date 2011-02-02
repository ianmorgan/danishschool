class AddContentForNewsPage < ActiveRecord::Migration
  def self.up
    Page.new(:page => 'news_header',       
             :description => 'Header for the news and news letters page', 
             :content => "<h1>School News</h1>").save

    Page.new(:page => 'news_footer',       
             :description => 'Footer for the news and news letters page', 
             :content => "").save

    # this page no longer used 
    Page.find_by_page('newsletters_header').delete
    Page.find_by_page('newsletters_footer').delete
   

  end

  def self.down
    Page.find_by_page('news_header').delete
    Page.find_by_page('news_footer').delete
  end
end
