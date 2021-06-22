class UsersController < ApplicationController
  def create
    user = User.new(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      biography: params[:biography],
      currently_reading: params[:currently_reading],
      #public: params[:public] == "1"
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    user = User.find(params[:id])
    user.username = params[:username] || user.username
    user.email = params[:email] || user.email
    user.biography = params[:biography] || user.biography
    user.currently_reading = params[:currently_reading] || user.currently_reading
    if user.save
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end  
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {message: "User successfully destroyed"}
  end
  
end
  