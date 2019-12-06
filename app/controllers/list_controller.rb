class ListController < ApplicationController
    before_action :authorized, only: [:create, :all]

    def create
        id = 0 
        params[:movie][:movieAPI_ID] ? id = params[:movie][:movieAPI_ID] : id = params[:movie][:id]
        user = User.find_by(username: params[:user][:username])

        if Movie.find_by(movieAPI_ID: id) then
            movieID = Movie.where(movieAPI_ID: id)[0].id
          
            if user.movie_lists.where(movie_id: movieID).length > 0 then 
                render json: {message: 'Already added to your list!'}
            else
                justAdded = MovieList.create(user_id: user.id, movie_id: movieID)
                render json: justAdded.movie
            end
        else
            @newMovie = Movie.find_or_create_by(
                backdrop_path: params[:movie]["backdrop_path"],
                budget: params[:movie]["budget"],
                home_path: params[:movie]["homepage"],
                movieAPI_ID: params[:movie]["id"],
                Imdb_ID: params[:movie]["imdb_id"],
                original_title: params[:movie]["original_title"],
                overview: params[:movie]["overview"],
                poster_path: params[:movie]["poster_path"],
                release_date: params[:movie]["release_date"],
                revenue: params[:movie]["revenue"],
                runtime: params[:movie]["runtime"],
                video: params[:movie]["video"],
                vote_average: params[:movie]["vote_average"])
            
            justAdded = MovieList.create(user_id: user.id, movie_id: @newMovie.id)  
            render json: justAdded.movie  
        end
        
    end

    def all
        userID = request.headers["User"]
        foundUser = User.find(userID)
        myMovies = foundUser.movies
        render json: myMovies
    end

end
