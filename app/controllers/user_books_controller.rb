class UserBooksController < ApplicationController
  before_action :authenticate_user
  def index
    user_books = current_user.user_books
    render json: user_books
  end

  def create
    user_books = UserBook.new(
      user_id: params[:user_id],
      google_books_api_id: params[:google_books_api_id],
      comments: params[:comments],
      have_read: params[:have_read],
    )
    if user_books.save
      render json: { message: "Succesfully Saved!" }, status: :created
    else
      render json: { message: "Please Login to Complete This Request" }, status: :unauthorized
    end
  end

  def update
    user_books = UserBook.find(params[:id])
    if current_user == user_books.user
      user_books.comments = params[:comments] || user.comments
      if user_books.save
        render json: user_books
      else
        render json: { message: "Please Login to Complete This Request" }, status: :unauthorized
      end
    end  
  end

  def destroy
    user_books = UserBook.find(params[:id])
    if current_user == user_books.user
    user_books.destroy
    render json: {message: "Successfully destroyed!"}
  end
end
