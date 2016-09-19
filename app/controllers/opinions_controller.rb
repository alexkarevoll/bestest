class OpinionsController < ApplicationController

  def new

  end

  def create

  end

  def edit

  end

  def update

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

end
