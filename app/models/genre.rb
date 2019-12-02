class Genre < ApplicationRecord
    has_many :genre_joints
    has_many :movies, through: :genre_joints
end
