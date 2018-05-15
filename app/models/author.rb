class Author < ApplicationRecord
  has_many :mangas
  belongs_to :publisher
  validates :name, uniqueness: true, presence: true

  def self.alphabetical
    self.order(:name)
  end
end
