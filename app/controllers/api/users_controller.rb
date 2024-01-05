class Api::UsersController < ApplicationController
  def index
    @users = User.all
    render json: {user: @users}
  end

  def create
    @user = User.new(user_params)
    if @user.save
      token = create_token(@user.id)
      render json: {status: "created success!", user: @user , token: token}
    else
      render json: {status: "created failed!" }
    end
  end

  def destroy
    @user.destroy
  end


  def login
    @user = User.find_by(email: user_params[:email])
    if @user && @user.authenticate(user_params[:passoword])
      token = create_token(@user.id)
      render json: { user: @user, token: token}
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :bio, :image)
  end

end
