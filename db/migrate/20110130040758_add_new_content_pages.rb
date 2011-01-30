#
# Adds content for new pages to existing site
# See also the danishschool:default_content rake task
#
class AddNewContentPages < ActiveRecord::Migration
  def self.up

    Page.new(:page => 'sponsors',       
             :description => 'The sponsors page', 
             :content => "Content for sponsors page goes here").save
    Page.new(:page => 'sponsors_header',
             :description => 'header section for sponsors page', 
    	     :content => 'h1. Our Sponsors').save
    Page.new(:page => 'sponsors_footer',
    	     :description => 'footer section for sponsors  page', 
	     :content => '').save
    Page.new(:page => 'newsletters_header',              
             :description => 'header section for newsletters page', 
    	     :content => 'h1. All Newsletters').save
    Page.new(:page => 'newsletters_footer',
    	     :description => 'footer section for newsletters page', 
	     :content => '').save
  
  end

  def self.down
    Page.find_by_page('sponsors').delete       
    Page.find_by_page('sponsors_header').delete
    Page.find_by_page('sponsors_footer').delete
    Page.find_by_page('newsletters_header').delete
    Page.find_by_page('newsletters_footer').delete
  end
end
