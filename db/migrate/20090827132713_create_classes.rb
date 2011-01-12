class CreateClasses < ActiveRecord::Migration
  def self.up
    create_table :classes do |t|
      t.string :code
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :classes
  end
end
