class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :story_title
      t.text :story_body
      t.string :story_image

      t.timestamps null: false
    end
  end
end
