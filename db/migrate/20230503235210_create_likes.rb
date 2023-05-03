class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.belongs_to :author, foreign_key: {to_table: :users}, index: true, counter_cache: true
      t.belongs_to :post, foreign_key: true, index: true, counter_cache: :likes_counter

      t.timestamps
    end
  end
end
