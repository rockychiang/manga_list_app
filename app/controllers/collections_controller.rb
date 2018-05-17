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
    render json: collection
  end

  def update
    @collection.update(collection_params)
    render json: @collection
  end

  def destroy
    @collection.delete
    render json: @collection
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
