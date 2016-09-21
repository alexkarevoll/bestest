class AddSentimentToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :sentiment, :boolean
  end
end
