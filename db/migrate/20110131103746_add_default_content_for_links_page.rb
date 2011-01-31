#
# Adds content for new links page on existing site
# See also the danishschool:default_content rake task
#
class AddDefaultContentForLinksPage < ActiveRecord::Migration
  def self.up
    Page.new(:page => 'links',       
             :description => 'The Links page', 
             :content => "Content for Links page goes here").save

    # added by mistake by last migration
    Page.find_by_page('sponsors_header').delete
    Page.find_by_page('sponsors_footer').delete
    
  end

  def self.down
    Page.find_by_page('links').delete       
  end
end
