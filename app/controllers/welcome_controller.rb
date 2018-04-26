class WelcomeController < ApplicationController
  def home
    @manga = Manga.all
  end
end
