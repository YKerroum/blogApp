class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.belongs_to :author, foreign_key: {to_table: :users}, index: true, counter_cache: true
      t.integer :likes_counter, default: 0
      t.integer :comments_counter, default: 0

      t.timestamps
    end
  end
end
