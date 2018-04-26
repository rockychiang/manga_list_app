class MangaController < ApplicationController
  before_action :require_login, :require_admin, except: [:index, :show]
  before_action :set_manga, only: [:show, :edit, :update]

  def index
    @manga = Manga.all
  end

  def show
    @collection = @manga.collections.find_or_initialize_by(user_id: current_user.id) if logged_in?
  end

  def new
    author = Author.new
    @manga = author.mangas.build
  end

  def create
    @manga = Manga.new(manga_params)
    if @manga.save
      redirect_to manga_path(@manga)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @manga.update(manga_params)
      redirect_to manga_path(@manga)
    else
      render :edit
    end
  end

  private

  def manga_params
    params.require(:manga).permit(:title, :status, :volumes, :chapters, :start_date, :end_date, author_attributes: :name)
  end

  def set_manga
      @manga = Manga.find(params[:id])
  end
end
