class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :avatar, :bio, :location, :favortie_genre
  #may need to come back and add the additional field to this 
  #attributes :username, :avatar, :bio, :location, :favorite_genre
end
