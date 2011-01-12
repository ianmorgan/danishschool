class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :name
      t.text :summary
      t.string :email
      t.binary :picture
      t.boolean :is_admin
      t.boolean :is_teacher
      t.boolean :is_committee_member

      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
