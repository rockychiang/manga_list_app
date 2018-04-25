class MangaController < ApplicationController
  before_action :require_login, :require_admin, except: [:index, :show]
  before_action :set_manga, only: [:show, :edit, :update]

  def index
    @manga = Manga.all
  end

  def new
  end

  def create
  end

  def show
    @collection = @manga.collections.find_or_initialize_by(user_id: current_user.id) if logged_in?
  end

  def edit
  end

  def update
  end

  private

  def set_manga
      @manga = Manga.find(params[:id])
  end
end
