class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :biography, :currently_reading
end
