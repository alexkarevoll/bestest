class AddPrepToOpinion < ActiveRecord::Migration
  def change
    add_column :opinions, :prep, :string
  end
end
