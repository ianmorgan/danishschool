class AddMemberIdToAttachment < ActiveRecord::Migration
  def self.up
    add_column :attachments, :member_id, :integer
  end

  def self.down
    remove_column :attachments, :member_id
  end
end
