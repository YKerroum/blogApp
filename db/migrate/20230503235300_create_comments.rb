class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.belongs_to :author, foreign_key: {to_table: :users}, index: true, counter_cache: true
      t.belongs_to :post, foreign_key: true, index: true, counter_cache: :comments_counter

      t.timestamps
    end
  end
end
