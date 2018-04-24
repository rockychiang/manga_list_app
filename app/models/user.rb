class User < ApplicationRecord
  has_many :collections
  has_many :mangas, through: :collections
  has_secure_password
  validates :name,
    presence: true,
    uniqueness: true,
    format: {with: /\A[a-zA-Z0-9_-]+\z/, message: "only letters, numbers, dash, and underscore are allowed"},
    length: {minimum: 3}
  validates :email, uniqueness: true, presence: true
  validates :password, length: {in: 6..20}

end
