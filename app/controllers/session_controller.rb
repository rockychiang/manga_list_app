class SessionController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if !!user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def facebook
    @user = User.find_or_create_by(email: auth['info']['email']) do |u|
      u.name = auth['info']['name']
    end

    session[:user_id] = @user.id

    redirect_to user_path(@user)
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
