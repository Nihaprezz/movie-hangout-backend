class Movie < ApplicationRecord
    has_many :genre_joints
    has_many :genres, through: :genre_joints

    #need to seed the genre tables with the API url, only 19 genres
    #need to seed the movie using the popular API url. 
    #create a new genre joint table relation ship for every genre a movie has. 
    #probably a couple of .each enumarable methods when pulling the info from the API
    # a movie can have one or two genres. 
    # need to create a serialized route for the right info of information.

    def seed_data
    end
end
