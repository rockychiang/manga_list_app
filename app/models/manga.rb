class Manga < ApplicationRecord
  has_many :collections
  has_many :users, through: :collections
  belongs_to :author
  belongs_to :publisher
end
