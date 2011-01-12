class RemoveIsMemberPictureFromAttachment < ActiveRecord::Migration
  def self.up
    remove_column :attachments, :is_member_picture
  end
  def self.down
    add_column :attachments, :is_member_picture, :boolean
  end
end
