class AddIsMemberPictureToAttachment < ActiveRecord::Migration
  def self.up
    add_column :attachments, :is_member_picture, :boolean
  end

  def self.down
    remove_column :attachments, :is_member_picture
  end
end
