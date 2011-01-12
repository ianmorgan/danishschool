class CreateLessons < ActiveRecord::Migration
  def self.up
    create_table :lessons do |t|
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :lessons
  end
end
