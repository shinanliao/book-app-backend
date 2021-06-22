class UserBooksController < ApplicationController
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
      render json: { errors: user_books.errors.full_messages }, status: :bad_request
    end
  end

  def update
    user_books = UserBook.find(params[:id])
    user_books.comments = params[:comments] || user.comments
    if user_books.save
      render json: user_books
    else
      render json: { errors: user_books.errors.full_messages }, status: :unprocessable_entity
    end  
  end

  def destroy
    user_books = UserBook.find(params[:id])
    user_books.destroy
    render json: {message: "Successfully destroyed!"}
  end
end
