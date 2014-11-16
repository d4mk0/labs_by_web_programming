class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.datetime :show_at
      t.boolean :is_published

      t.timestamps
    end
  end
end
