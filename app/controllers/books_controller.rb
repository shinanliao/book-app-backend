class BooksController < ApplicationController
#write an index method so that user can query by title and not by id
  def index
    query = params[:query].gsub(" ", "%")
    books = HTTP.get("https://www.googleapis.com/books/v1/volumes?q=#{query}&printType=books&key=#{Rails.application.credentials.google_books_api_key}")
    render json: books.parse(:json)["items"][0]
  end

  def show
    book_id = params[:id]
    book = HTTP.get("https://www.googleapis.com/books/v1/volumes?q=#{book_id}&printType=books&key=#{Rails.application.credentials.google_books_api_key}")
    render json: book.parse(:json)["items"][0]
  end  
end
