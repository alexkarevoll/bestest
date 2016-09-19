class AddTagsToOpinion < ActiveRecord::Migration
  def change
    add_column :opinions, :tags, :string
  end
end
