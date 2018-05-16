class CollectionsController < ApplicationController
  before_action :require_login
  before_action :owner?, only: [:update, :destroy]

  def index
    @user = User.find(params[:user_id])
    respond_to do |f|
      f.html { render :index }
      f.json { render json: @user.collections }
    end
  end

  def create
    collection = Collection.create(collection_params)
    respond_to do |f|
      f.html { redirect_to request.referer }
      f.json { render json: collection }
    end
  end

  def update
    @collection.update(collection_params)
    respond_to do |f|
      f.html { redirect_to request.referer }
      f.json { render json: @collection }
    end
  end

  def destroy
    @collection.delete
    redirect_to user_collections_path(current_user)
  end

  private

  def collection_params
    params.require(:collection).permit(:user_id, :manga_id, :status, :last_read, :review, :rating)
  end

  def owner?
    @collection = Collection.find(params[:id])
    redirect_to request.referer unless current_user.id == @collection.user_id
  end
end
