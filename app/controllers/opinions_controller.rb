class OpinionsController < ApplicationController
before_action :authorize, only: [:show, :new, :destroy, :create]


  def new
    @opinion = Opinion.new
    @opinions = Opinion.order(upvotes: :desc)
  end

  def create
    @opinion = User.find(session[:user_id]).opinions.new(opinion_params)
    @opinion.upvotes ||= 0
    @opinion.downvotes ||= 0
    if @opinion.save
      redirect_to new_opinion_path
    end
  end

  def index
    @opinions = Opinion.order(upvotes: :desc)
  end

  def show
    @opinion = Opinion.find(params[:id])
  end

  def destroy
    @opinion = Opinion.find(params[:id])
    @opinion.destroy
    redirect_to(opinions_path)
  end

  def upvote
    @opinion = Opinion.find(params[:id])
    @opinion.upvotes += 1
    @opinion.save
    redirect_to :back
  end

  def downvote
    @opinion = Opinion.find(params[:id])
    @opinion.upvotes -= 1
    @opinion.save
    redirect_to :back
  end

  private
  def opinion_params
    params.require(:opinion).permit(:item, :category, :field, :prep)
  end

end
