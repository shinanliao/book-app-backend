class UserBookSerializer < ActiveModel::Serializer
  attributes :id, :google_books_api_id, :comments, :have_read, :book
end
