class UserBooksController < ApplicationController
  def index
    user_books = current_user.user_books
    render json: user_books
  end
end
