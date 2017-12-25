class IdeasController < ApplicationController
  def index
    render json: Idea.all
  end

  def show
    idea = Idea.find(params[:id])
    render json: idea
  end

  def create
    idea = Idea.create(idea_params)
    render json: idea
  end

  def update
    idea = Idea.find(params[:id])
    idea.update(idea_params)
    render json: idea
  end

  def destroy
    idea = Idea.find(params[:id])
    idea.destroy
    render json: idea
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :body)
  end
end
