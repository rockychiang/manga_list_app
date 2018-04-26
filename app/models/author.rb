class Author < ApplicationRecord
  has_many :mangas
  validates :name, uniqueness: true, presence: true

  def self.alphabetical
    self.order(:name)
  end
end
