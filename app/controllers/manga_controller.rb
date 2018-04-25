class MangaController < ApplicationController
  def index
    @manga = Manga.all
  end

  def new
  end

  def create
  end

  def show
    @manga = Manga.find(params[:id])
    @collection = @manga.collections.find_or_initialize_by(user_id: current_user.id)
  end

  def edit
  end

  def update
  end
end
