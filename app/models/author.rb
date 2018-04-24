class Author < ApplicationRecord
  has_many :mangas
  has_many :publishers, through: :mangas
end
