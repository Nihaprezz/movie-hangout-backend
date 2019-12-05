class CommentController < ApplicationController
  before_action :authorized, only: [:create, :show, :destroy]

  def index
    comments = Comment.all
    render json: comments
  end

  def create
    movie = params["movie"]
    content = params["content"]

    if movie["movieAPI_ID"]
      comment = Comment.create({
        user_id: current_user.id,
        movie_id: movie["id"],
        content: content
      })
      render json: comment 
    else
      movie = Movie.find_by(movieAPI_ID: movie["id"])
      if movie
        comment = Comment.create({
        user_id: current_user.id,
        movie_id: movie.id,
        content: content
        })
        render json: comment 
      else
        movieCreated = Movie.find_or_create_by(
          backdrop_path: movie["backdrop_path"], 
          budget: movie["budget"], 
          home_path: movie["homepage"],
          movieAPI_ID: movie["id"],
          Imdb_ID: movie["imdb_id"],
          original_title: movie["original_title"],
          overview: movie["overview"],
          poster_path: movie["poster_path"],
          release_date: movie["release_date"],
          revenue: movie["revenue"],
          runtime: movie["runtime"],
          video: movie["video"],
          vote_average: movie["vote_average"]
        )
        comment = Comment.create({
          user_id: current_user.id,
          movie_id: movieCreated.id,
          content: content
        })
        render json: comment
      end
    end

  end

  def show
    userId = params[:id]
    myComments = Comment.all.where(user_id: userId)
    render json: myComments
  end

  def movie
    movieApiID = params[:movieApiID]
    movie = Movie.all.find_by(movieAPI_ID: movieApiID)
    render json: movie.comments
  end

  def destroy
    commentId = params[:id]
    comment = Comment.find(commentId).destroy
    render json: comment
  end

end
