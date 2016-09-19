class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.string :item
      t.string :category
      t.string :field
      t.references :user, index: true, foreign_key: true
      t.integer :upvotes
      t.integer :downvotes

      t.timestamps null: false
    end
  end
end
