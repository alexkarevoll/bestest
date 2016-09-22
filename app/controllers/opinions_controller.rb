class OpinionsController < ApplicationController
before_action :authorize, only: [:show, :new, :destroy, :create]


  def new
    @opinion = Opinion.new
    @opinions = Opinion.order(created_at: :desc)
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
    @opinions = Opinion.all
    if params[:search]
      # banana
      @opinions = Opinion.search(params[:search]).order("created_at DESC")
      if @opinions.count == 0
        flash[:alert] = "Nothing here, you should tell everyone what's the best!"
      end
    else
      @opinions = Opinion.all.order('created_at DESC')
    end
  end

  def show
    @opinion = Opinion.find(params[:id])
  end

  def destroy
    @opinion = Opinion.find(params[:id])
    @opinion.destroy
    redirect_to(new_opinion_path)
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
