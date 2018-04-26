class WelcomeController < ApplicationController
  def home
    @manga = Manga.popular(9)
  end
end
