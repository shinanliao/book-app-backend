class UserBooksController < ApplicationController
  before_action :authenticate_user
  def index
    user_books = current_user.user_books
    render json: user_books
  end

  def create
    user_books = UserBook.new(
      user_id: current_user.id,
      google_books_api_id: params[:google_books_api_id],
      comments: params[:comments],
      have_read: params[:have_read],
    )
    if user_books.save
      render json: user_books, status: :created
    else
      render json: { errors: user_books.errors.full_messages }, status: :unauthorized
    end
  end

  def update
    user_books = UserBook.find(params[:id])
    if current_user == user_books.user
      user_books.comments = params[:comments] || user_books.comments
      if params[:have_read] == true
        user_books.have_read = true
      elsif params[:have_read] == false
        user_books.have_read = false
      end
      if user_books.save
        render json: user_books
      else
        render json: { errors: user_books.errors.full_messages }, status: :unauthorized
      end
    end  
  end

  def destroy
    user_books = UserBook.find(params[:id])
    if current_user == user_books.user
      user_books.delete
      render json: {message: "Successfully destroyed!"}
    end
  end
end
