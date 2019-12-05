class MovieController < ApplicationController
    require 'rest-client'

    skip_before_action :authorized, only: [:popular, :movieDetails, :all, :topRated, :upcoming, :nowPlaying]

    MOVIE_API_KEY = ENV['movieAPIKey']

    def popular
        #page variable can probably be changed by a params we can pass in front front end 
        page = params["page"]
        url = "https://api.themoviedb.org/3/movie/popular?page=#{page}&language=en-US&api_key=#{MOVIE_API_KEY}"
        response = RestClient.get("#{url}")
        parsedJSON = JSON.parse(response)

        render json: parsedJSON["results"]
    end

    def movieDetails 
        movieID = params[:id] # movie API ID
        url = "https://api.themoviedb.org/3/movie/#{movieID}?api_key=e53ae350da5b73066053a3817dc2c94c&language=en-US"
        response = RestClient.get("#{url}")
        render json: response
    end

    def topRated
        top_rating_page = 1
        url = "https://api.themoviedb.org/3/movie/top_rated?api_key=#{MOVIE_API_KEY}&language=en-US&page=#{top_rating_page}"
        response = RestClient.get("#{url}")
        parsedJSON = JSON.parse(response)

        render json: parsedJSON["results"]
    end
    
    def upcoming
        upcoming_page = 1 
        url = "https://api.themoviedb.org/3/movie/upcoming?api_key=#{MOVIE_API_KEY}&language=en-US&page=#{upcoming_page}"
        response = RestClient.get("#{url}")
        parsedJSON = JSON.parse(response)

        render json: parsedJSON["results"]
    end

    def nowPlaying
        now_playing_page = 1
        url = "https://api.themoviedb.org/3/movie/now_playing?api_key=#{MOVIE_API_KEY}&language=en-US&page=#{now_playing_page}"
        response = RestClient.get("#{url}")
        parsedJSON = JSON.parse(response)
        saveInDatabase(parsedJSON)

        render json: parsedJSON["results"]
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
