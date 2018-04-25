class CollectionsController < ApplicationController
  before_action :owner?

  def create
    Collection.create(collection_params)
    redirect_to request.referer
  end

  def update
    collection = Collection.find(params[:id])
    collection.update(collection_params)
    redirect_to request.referer
  end

  def destroy
    collection = Collection.find(params[:id])
    collection.delete
    redirect_to user_path(current_user)
  end

  private

  def collection_params
    params.require(:collection).permit(:user_id, :manga_id, :status, :last_read, :review, :rating)
  end

  def owner?
    redirect_to request.referer unless current_user.id == params[:user_id].to_i
  end
end
