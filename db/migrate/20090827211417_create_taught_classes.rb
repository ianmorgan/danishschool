class CreateTaughtClasses < ActiveRecord::Migration
  def self.up
    create_table :taught_classes do |t|
      t.string :code
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :taught_classes
  end
end
