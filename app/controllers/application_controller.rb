class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

  def current_user
    @current_user ||= User.find_by(id: sessions[:user_id])
  end

  def logged_in?
    !!current_user
  end

end
