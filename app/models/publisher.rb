class Publisher < ApplicationRecord
  has_many :mangas
  has_many :authors, through: :mangas
end
