class CreateNewsItems < ActiveRecord::Migration
  def self.up
    create_table :news_items do |t|
      t.date :news_date
      t.text :news_text

      t.timestamps
    end
  end

  def self.down
    drop_table :news_items
  end
end
