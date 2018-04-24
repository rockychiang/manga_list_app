class Author < ApplicationRecord
  has_many :mangas
  validates :name, uniqueness: true, presence: true
end
