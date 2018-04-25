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
  end

  def edit
  end

  def update
  end
end
