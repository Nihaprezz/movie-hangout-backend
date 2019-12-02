class UserSerializer < ActiveModel::Serializer
  attributes :username, :avatar, :bio
  #may need to come back and add the additional field to this 
  #attributes :username, :avatar, :bio, :location, :favorite_genre
end
