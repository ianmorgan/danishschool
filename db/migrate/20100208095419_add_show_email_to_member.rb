class AddShowEmailToMember < ActiveRecord::Migration
  def self.up
    add_column :members, :show_email, :boolean, :default => false
  end

  def self.down
    remove_column :members, :show_email
  end
end
