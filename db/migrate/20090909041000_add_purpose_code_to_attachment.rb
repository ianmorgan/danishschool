class AddPurposeCodeToAttachment < ActiveRecord::Migration
  def self.up
    add_column :attachments, :purpose_code, :string
  end

  def self.down
    remove_column :attachments, :purpose_code
  end
end
