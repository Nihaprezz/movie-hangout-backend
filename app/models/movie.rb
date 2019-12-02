class Movie < ApplicationRecord
    has_many :genre_joints
    has_many :genres, through: :genre_joints
end
