class Api::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user == user.authenticate(params[:session][:password])
      reset_session
      log_in user
      puts ("login success! welcome #{user.username}!!!")
      token = create_token(user.id)
      render json: { user: user, token: token}
      # redirectはフロントで
    else
      puts ("login failed")
    end
  end

  def destroy
    log_out

   # redirectはフロントで
  end

  private

    def log_in(user)
      session[:id] == user.id
    end

    def log_out
      reset_session

    end

    # def current_user
    #   if session[:user_id]
    #     current_user || = User.find-by(id: session[:user_id])
    #   end
    #   # render json: { current_user: current_user}
    # end

    def logged_in?
      !current_user.nil!
    end
end
