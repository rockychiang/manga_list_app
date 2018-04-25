class CollectionsController < ApplicationController
  before_action :owner?

  def create
    raise params.inspect
  end

  def show
  end

  def update
  end

  def destroy
    collection = Collection.find(params[:id])
    collection.delete
    redirect_to user_path(current_user)
  end

  private

  def owner?
    user = User.find(params[:user_id])
    redirect_to user_path(user) unless current_user == user
  end
end
