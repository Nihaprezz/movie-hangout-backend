class User < ApplicationRecord
    has_many :movie_lists
    has_many :movies, through: :movie_lists
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false}
end
