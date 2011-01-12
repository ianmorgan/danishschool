class AddPasswordPasswordConfirmationToMember < ActiveRecord::Migration
  def self.up
    add_column :members, :password, :string
    add_column :members, :password_confirmation, :string
  end

  def self.down
    remove_column :members, :password_confirmation
    remove_column :members, :password
  end
end
