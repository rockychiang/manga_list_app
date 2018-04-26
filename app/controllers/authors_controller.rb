class AuthorsController < ApplicationController
  def index
    @authors = Author.all.alphabetical
  end

  def show
    @author = Author.find(params[:id])
  end
end
