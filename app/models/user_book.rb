class UserBook < ApplicationRecord
  belongs_to :user
  
  def book
    # logic to query the 3rd party api for the correct book
    # get back an object of book data
    response = HTTP.get("https://www.googleapis.com/books/v1/volumes?q=#{google_books_api_id}&printType=books&key=#{Rails.application.credentials.google_books_api_key}")
    api_book_object = response.parse(:json)["items"][0]
    # return api_book_object
    return {
      id: api_book_object["id"],
      title: api_book_object["volumeInfo"]["title"],
      subtitle: api_book_object["volumeInfo"]["subtitle"],
      author: api_book_object["volumeInfo"]["authors"][0],
      publisher: api_book_object["volumeInfo"]["publisher"],
      description: api_book_object["volumeInfo"]["description"],
    }
  end
end
