class User < ApplicationRecord
  has_many :collections
  has_many :mangas, through: :collections
end
