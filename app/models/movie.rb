class Movie < ApplicationRecord
    has_many :movie_lists
    has_many :users, through: :movie_lists

    has_many :genre_joints
    has_many :genres, through: :genre_joints

    has_many :comments


    require 'rest-client'
    MOVIE_API_KEY = ENV['movieAPIKey']
    #need to seed the genre tables with the API url, only 19 genres
    #need to seed the movie using the popular API url. 
    #create a new genre joint table relation ship for every genre a movie has. 
    #probably a couple of .each enumarable methods when pulling the info from the API
    # a movie can have one or two genres. 
    # need to create a serialized route for the right info of information.

    def self.seed
        USED TO SEED THE GENRE DATA INTO THE DB
        url = "https://api.themoviedb.org/3/genre/movie/list?api_key=#{MOVIE_API_KEY}&language=en-US"
        response = RestClient.get(url)
        parsed = JSON.parse(response)

        parsed["genres"].each do |genre|
            Genre.find_or_create_by(genre_API_ID: genre["id"], name: genre["name"])
        end


        SEEDING THE MOVIE DATABASE
        page = 2 #last ran at 26

        url = "https://api.themoviedb.org/3/movie/popular?page=#{page}&language=en-US&api_key=#{MOVIE_API_KEY}"
        response = RestClient.get(url)
        parsed = JSON.parse(response)

        parsed["results"].each do |movie|
            secondURL = "https://api.themoviedb.org/3/movie/#{movie['id']}?api_key=#{MOVIE_API_KEY}&language=en-US"
            
            secondResp = RestClient.get(secondURL)
            secondParsed = JSON.parse(secondResp)
            Movie.findOrCreateMovie(secondParsed, movie)
        end
    end

    def self.findOrCreateMovie(secondParsed, movie)
        #seeding the movie data
        Movie.find_or_create_by(
            backdrop_path: secondParsed["backdrop_path"], 
            budget: secondParsed["budget"], 
            home_path: secondParsed["homepage"],
            movieAPI_ID: secondParsed["id"],
            Imdb_ID: secondParsed["imdb_id"],
            original_title: secondParsed["original_title"],
            overview: secondParsed["overview"],
            poster_path: secondParsed["poster_path"],
            release_date: secondParsed["release_date"],
            revenue: secondParsed["revenue"],
            runtime: secondParsed["runtime"],
            video: secondParsed["video"],
            vote_average: secondParsed["vote_average"],
        )

        #taking care of creating the genres  
        secondParsed["genres"].each do | genre |
            gen = Genre.find_by(genre_API_ID: genre["id"])
            mov = Movie.find_by(movieAPI_ID: movie["id"])
            GenreJoint.find_or_create_by(
                movie_id: mov.id, 
                genre_id: gen.id
                )
        end
    end
end
