class AddFKsToLesson < ActiveRecord::Migration
  def self.up
    add_column :lessons, :taught_class_id, :integer
    add_column :lessons, :event_id, :integer
  end

  def self.down
    remove_column :lessons, :event_id
    remove_column :lessons, :taught_class_id
  end
end
