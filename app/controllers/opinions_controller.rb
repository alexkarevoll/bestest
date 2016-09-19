class OpinionsController < ApplicationController
before_action :authorize, only: [:show, :new]


  def new
    @opinion = Opinion.new
  end

  def create
    @opinion = User.find(session[:user_id]).opinions.new(opinion_params)
    if @opinion.save
      redirect_to opinions_path
    end
  end

  def index
    @opinions = Opinion.all
  end

  def show
    @opinion = Opinion.find(params[:id])
  end

  def destroy
    @opinion = Opinion.find(params[:id])
    @opinion.destroy
    redirect_to(opinions_path)
  end

  private
  def opinion_params
    params.require(:opinion).permit(:item, :category, :field)
  end

end
