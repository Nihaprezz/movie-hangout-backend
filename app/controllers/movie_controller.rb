class MovieController < ApplicationController
    require 'rest-client'

    skip_before_action :authorized, only: [:popular, :movieDetails, :all]

    MOVIE_API_KEY = ENV['movieAPIKey']

    def popular
        #page variable can probably be changed by a params we can pass in front front end 
        page = 1
        url = "https://api.themoviedb.org/3/movie/popular?page=#{page}&language=en-US&api_key=#{MOVIE_API_KEY}"
        response = RestClient.get("#{url}")
        render json: response
    end

    def movieDetails 
        #same here, we can change the movie id by passing a param front the front end, like a show page
        movieID = 466272
        url = "https://api.themoviedb.org/3/movie/#{movieID}?api_key=e53ae350da5b73066053a3817dc2c94c&language=en-US"
        response = RestClient.get("#{url}")
        render json: response
    end

    def all
        movies = Movie.all
        render json: movies.to_json(serialized_data)
    end

    private
    
    def serialized_data
        {
            :include => {
                :genres => 
                {:except => [:created_at, :updated_at]}
            },
            :except => [:created_at, :updated_at]
        }
    end

end
