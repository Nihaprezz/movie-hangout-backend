class CommentController < ApplicationController
  before_action :authorized

  def index
    render json: Comment.all
  end

  def create
    comment = Comment.create({
      user_id: current_user.id,
      movie_id: params["movieId"],
      content: params["content"]
    })
    render json: comment
  end

  def destroy

  end

end
