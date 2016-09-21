class VotesController < ApplicationController
  def upvote
    # is there a vote already by that user for that opinion
    @vote = Vote.find_by({opinion_id: params[:opinion_id], user_id: current_user.id})
    if @vote
      @vote.sentiment = true
    else
      @opinion = Opinion.find(params[:opinion_id])
      @vote = @opinion.votes.new({sentiment: true})
      @vote.user = current_user
    end
    @vote.save
    redirect_to new_opinion_path
  end

  def downvote
    # is there a vote already by that user for that opinion
    @vote = Vote.find_by({opinion_id: params[:opinion_id], user_id: current_user.id})
    if @vote
      @vote.sentiment = false
    else
      @opinion = Opinion.find(params[:opinion_id])
      @vote = @opinion.votes.new({sentiment: false})
      @vote.user = current_user
    end
    @vote.save
    redirect_to new_opinion_path
  end
end
