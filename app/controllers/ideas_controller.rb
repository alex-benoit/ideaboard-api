class IdeasController < ApplicationController
  def index
    render json: Idea.order(created_at: :desc)
  end

  def show
    idea = Idea.find(params[:id])
    render json: idea
  end

  def create
    idea = Idea.new(idea_params)
    if idea.save
      render json: idea, status: :created
    else
      render status: :bad_request
    end
  end

  def update
    idea = Idea.find(params[:id])
    if idea.update(idea_params)
      render json: idea
    else
      render status: :bad_request
    end
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
