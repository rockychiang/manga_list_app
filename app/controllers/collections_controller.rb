class CollectionsController < ApplicationController
  before_action :owner?

  def create
    session[:return_to] ||= request.referer
    Collection.create(collection_params)
    redirect_to session.delete(:return_to)
  end

  def show
  end

  def update
    session[:return_to] ||= request.referer
    collection = Collection.find(params[:id])
    collection.update(collection_params)
    redirect_to session.delete(:return_to)
  end

  def destroy
    collection = Collection.find(params[:id])
    collection.delete
    redirect_to user_path(current_user)
  end

  private

  def collection_params
    params.require(:collection).permit(:user_id, :manga_id, :status)
  end

  def owner?
    user = User.find(params[:user_id])
    redirect_to user_path(user) unless current_user == user
  end
end
